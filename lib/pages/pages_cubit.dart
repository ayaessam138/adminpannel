import 'dart:io';
import 'dart:typed_data';

import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/pages/PagesModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'pages_state.dart';

class PagesCubit extends Cubit<PagesState> {
  PagesCubit() : super(PagesInitial());

  TextEditingController title = TextEditingController();
  TextEditingController titleEn = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController contentEn = TextEditingController();
  TextEditingController slug = TextEditingController();
  List <PagesModel> PagesList=[];
  void GetallPages() {
    emit(PagesLoading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallPagesy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(PagesFail());
      } else {
        PagesList = List.of(data).map((e) => PagesModel.fromJson(e)).toList();
        Utility.myPrintX(PagesList.length);
        emit(PagesSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallPagesyEror');
      Utility.myPrintX(onError.toString());

      emit(PagesFail());
      // throw onError;
    });
  }

  PagesModel PagesbyIdModel =
  PagesModel(id: 0, title: '', titleEn: '', status: 0, createdAt: '', content: '', contentEn: '', slug: '', );
  Map<String, dynamic> Pagesdata = {};
  Future<void> GetPagesbyid({required int id}) async {
    emit(GetPagesByIdLoading());
    await DioHelper.getData(url: "Pages/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetPagesbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Pagesdata = value.data['data'];
      Utility.myPrintX(Pagesdata);
      if (value.data['statusCode'] != 200) {
        emit(GetPagesByIdFail());
      } else {
        PagesbyIdModel = PagesModel.fromJson(Pagesdata);

        emit(GetPagesByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetPagesbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetPagesByIdFail());
      throw onError;
    });
  }

  void RemovePages({required int PagesId, required int index}) {
    emit(RemovePagesLoading());

    DioHelper.DeleteData(url: 'Pages/DeletePages', qurey: {'id': PagesId})
        .then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemovePages');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemovePagesFail');
        emit(RemovePagesFail());
      } else {
        PagesList.removeAt(index);

        emit(RemovePagesSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemovePages error');
      Utility.myPrintX(onError.toString());
      emit(RemovePagesFail());
      // throw onError;
    });
  }

  Future<void> AddPages(
      PagesModel pagesModel, AddPagesimage addPagesimage) async {
    Utility.myPrintX(PagesModel.postToJson(pagesModel));
    emit(AddPagesLoading());
    await DioHelper.postData(
        data: AddPagesimage.postToJson(addPagesimage),
        url: "Pages/AddUpdate",
        query: PagesModel.postToJson(pagesModel))
        .then((response) {
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> PagesData = response.data;
      if (PagesData["statusCode"] != 200) {
        Utility.myPrintX('Addpartner FAil');

        emit(AddPagesFail());
      } else {
        emit(AddPagesSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX(onError.toString());
      emit(AddPagesFail());
      throw onError;
    });
  }

  String selectedOption = '';
  SelectRadioButton(value) {
    selectedOption = value;
    emit(SelectOption());
  }

  Future<void> EditPages(PagesModel pagesModel) async {
    title.text = pagesModel.title ?? '';
    titleEn.text = pagesModel.titleEn ?? '';
    content.text = pagesModel.content ?? '';
    contentEn.text = pagesModel.contentEn ?? '';
    slug.text = pagesModel.slug.toString() ?? '';
    selectedOption = pagesModel.status == 1 ? 'Posted' : 'NotPosted';

    emit(EditPagesstate());
  }

  Future<void> RemoveData() async {
    title.clear();
    titleEn.clear();
    content.clear();
    contentEn.clear();
    contentEn.clear();
    slug.clear();
    selectedOption = '';
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
