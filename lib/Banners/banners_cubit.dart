import 'dart:io';
import 'dart:typed_data';

import 'package:afcooadminpanel/Banners/bannersModel.dart';
import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit() : super(BannersInitial());

  TextEditingController title=TextEditingController();
  TextEditingController titleEn=TextEditingController();
  TextEditingController url=TextEditingController();
  TextEditingController Durationofshow=TextEditingController();
  TextEditingController ItemOrder=TextEditingController();
  String selectedOptionforcase='';
  String selectedOptionforShowinApp='';
  String selectedOptionforShowinWebsite='';
  List <BannersModel> BannersList=[];
  void GetallBanners() {
    emit(BannersLoading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallBannersy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(BannersFail());
      } else {
        BannersList = List.of(data).map((e) => BannersModel.fromJson(e)).toList();
        Utility.myPrintX(BannersList.length);
        emit(BannersSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallBannersyEror');
      Utility.myPrintX(onError.toString());

      emit(BannersFail());
      // throw onError;
    });
  }
  BannersModel BannersbyIdModel =
  BannersModel(id: 0, title: '', titleEn: '', url: '', status: 0, image: '', ShowinWebSite: 0, ShowinApp: 0, Durantion: 0, ItemOrder: 0);
  Map<String, dynamic> Bannersdata = {};
  Future<void> GetBannersbyid({required int id}) async {
    emit(GetBannersByIdLoading());
    await DioHelper.getData(url: "Banners/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetBannersbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Bannersdata = value.data['data'];
      Utility.myPrintX(Bannersdata);
      if (value.data['statusCode'] != 200) {
        emit(GetBannersByIdFail());
      } else {
        BannersbyIdModel = BannersModel.fromJson(Bannersdata);

        emit(GetBannersByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetBannersbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetBannersByIdFail());
      throw onError;
    });
  }

  void RemoveBanners({required int BannersId, required int index}) {
    emit(RemoveBannersLoading());

    DioHelper.DeleteData(url: 'Banners/DeleteBanners', qurey: {'id': BannersId})
        .then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveBanners');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemoveBannersFail');
        emit(RemoveBannersFail());
      } else {
        BannersList.removeAt(index);

        emit(RemoveBannersSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveBanners error');
      Utility.myPrintX(onError.toString());
      emit(RemoveBannersFail());
      // throw onError;
    });
  }

  void AddBanners(
      {required BannersModel bannersModel,
        required AddBannersimage addBannersimage}) async {
    Utility.myPrintX(BannersModel.postToJson(bannersModel));
    Utility.myPrintX(AddBannersimage.postToJson(addBannersimage).toString());
    emit(AddBannersLoading());

    DioHelper.postDataFormat(
        query: BannersModel.postToJson(bannersModel),
        url: "Banners/AddUpdate",
        data: AddBannersimage.postToJson(addBannersimage))
        .then((response) {
      Utility.myPrintX('AddBanners');
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> Bannersdata = response.data;

      if (Bannersdata["statusCode"] != 200) {
        Utility.myPrintX('AddBannersFAil');

        emit(AddBannersFail());
      } else {
        emit(AddBannersSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('AddBannerserror');
      Utility.myPrintX(onError.toString());

      emit(AddBannersFail());
    });
  }
  SelectRadioButtonForcase(value) {
    selectedOptionforcase = value;
    emit(SelectOptionforcaseState());
  }  SelectRadioButtonForShowinapp(value) {
    selectedOptionforShowinApp = value;
    emit(SelectOptionforShowinAppState());
  }  SelectRadioButtonForShowinWebsite(value) {
    selectedOptionforShowinWebsite = value;
    emit(SelectOptionforShowinWebSitestate());
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
  int DurationofshowCounter=0;
  SaveDurationofshowCount(value) {
    Durationofshow.text = value;
    DurationofshowCounter = int.parse(value);
    emit(SaveDurationofshowCounter());
  }

  IncrementDurationofshowCounter() {
    DurationofshowCounter++;
    Durationofshow.text = DurationofshowCounter.toString();
    print(DurationofshowCounter);
    emit(IncDurationofshowCounter());
  }

  DecrementDurationofshowCounter() {
    if (DurationofshowCounter > 0) DurationofshowCounter--;
    Durationofshow.text = DurationofshowCounter.toString();
    emit(DecDurationofshowCounter());
  }
  void ChangeState() {
    emit(StateChanged());
  }


  Future<void> EditBanners(BannersModel bannersModel)async {
    title.text=bannersModel.title??'';
    titleEn.text=bannersModel.titleEn??'';
    url.text=bannersModel.url??'';
    Durationofshow.text=bannersModel.Durantion.toString()??'';
    ItemOrder.text=bannersModel.ItemOrder.toString()??'';
    selectedOptionforcase=bannersModel.status==1?'Posted':'NotPosted';
    selectedOptionforShowinWebsite=bannersModel.ShowinWebSite==1?'Yes':'No';
    selectedOptionforShowinApp=bannersModel.ShowinApp==1?'Yes':'No';
    emit(EditBannersstate());
  }
  Future<void> RemoveData() async {
    title.clear();
    titleEn.clear();
    url.clear();
    Durationofshow.clear();
    ItemOrder.clear();
    selectedOptionforcase = '';
    emit(RemoveDataState());
  }
}
