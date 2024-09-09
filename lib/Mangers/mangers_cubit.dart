import 'dart:io';
import 'dart:typed_data';

import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/Mangers/mangersModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'mangers_state.dart';

class MangersCubit extends Cubit<MangersState> {
  MangersCubit() : super(MangersInitial());

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController Mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController title = TextEditingController();
  String selectedOptionforLanguagevalue='';
  String selectedOptionForAccountvalue='';
  List<MangersModel> MangersList = [];
  void GetallMangers() {
    emit(MangersLoading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallMangersy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(MangersFail());
      } else {
        MangersList =
            List.of(data).map((e) => MangersModel.fromJson(e)).toList();
        Utility.myPrintX(MangersList.length);
        emit(MangersSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallMangersyEror');
      Utility.myPrintX(onError.toString());

      emit(MangersFail());
      // throw onError;
    });
  }

  MangersModel MangersbyIdModel = MangersModel(
      name: '',
      userName: '',
      mobile: '',
      email: '',
      image: '',
      status: '',
      userType: '',
      CreatedAt: '', title: '', id: 0);
  Map<String, dynamic> Mangersdata = {};
  Future<void> GetMangersbyid({required int id}) async {
    emit(GetMangersByIdLoading());
    await DioHelper.getData(url: "Mangers/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetMangersbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Mangersdata = value.data['data'];
      Utility.myPrintX(Mangersdata);
      if (value.data['statusCode'] != 200) {
        emit(GetMangersByIdFail());
      } else {
        MangersbyIdModel = MangersModel.fromJson(Mangersdata);

        emit(GetMangersByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetMangersbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetMangersByIdFail());
      throw onError;
    });
  }

  void RemoveMangers({required int MangersId, required int index}) {
    emit(RemoveMangersLoading());

    DioHelper.DeleteData(url: 'Mangers/DeleteMangers', qurey: {'id': MangersId})
        .then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveMangers');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemoveMangersFail');
        emit(RemoveMangersFail());
      } else {
        MangersList.removeAt(index);

        emit(RemoveMangersSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveMangers error');
      Utility.myPrintX(onError.toString());
      emit(RemoveMangersFail());
      // throw onError;
    });
  }
  Future<void> AddMangers(
      MangersModel mangersModel,) async {
    Utility.myPrintX(MangersModel.postToJson(mangersModel));
    emit(AddMangersLoading());
    await DioHelper.postData(

        url: "Mangers/AddUpdate",
        data: MangersModel.postToJson(mangersModel))
        .then((response) {
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> MangersData = response.data;
      if (MangersData["statusCode"] != 200) {
        Utility.myPrintX('Addpartner FAil');

        emit(AddMangersFail());
      } else {
        emit(AddMangersSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX(onError.toString());
      emit(AddMangersFail());
      throw onError;
    });
  }
  SelectRadioButtonforLanguage(value) {
    selectedOptionforLanguagevalue = value;
    emit(selectedOptionforLanguageState());
  }
  SelectRadioButtonforAccount(value) {
    selectedOptionForAccountvalue = value;
    emit(selectedOptionForAccountState());
  }
  Future<void> EditMangers(MangersModel mangersModel) async {
    name.text = mangersModel.name ?? '';
    username.text = mangersModel.userName ?? '';
    password.text = mangersModel.password ?? '';
    confirmPassword.text = mangersModel.confirmPassword ?? '';
    Mobile.text = mangersModel.mobile?? '';
    email.text = mangersModel.email ?? '';
    title.text = mangersModel. title?? '';


    emit(EditMangersstate());
  }

  Future<void> RemoveData() async {
    name.clear();
    username.clear();
    password.clear();
    confirmPassword.clear();
    confirmPassword.clear();
    Mobile.clear();
    email.clear();
    title.clear();

    emit(RemoveDataState());
  }

  File? selectedimagefile;
  Uint8List? selectedImageUnit8List;
  // String? filePath;
  XFile? selectedImageXFile;
  Future<void> PickImage() async {
    selectedImageXFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (selectedImageXFile != null) {
      selectedimagefile = File(selectedImageXFile!.path);
      final selectedImage = await selectedImageXFile!.readAsBytes();
      selectedImageUnit8List ??= selectedImage;

      print('selectedLogo');
      print(selectedImageUnit8List);
      emit(UploadImage());
    }
  }
}
