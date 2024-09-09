import 'dart:io';
import 'dart:typed_data';

import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/WebsiteMangement/websiteContentMangement/websiteContentMangementModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'website_content_mangement_state.dart';

class WebsiteContentMangementCubit extends Cubit<WebsiteContentMangementState> {
  WebsiteContentMangementCubit() : super(WebsiteContentMangementInitial());
  List<WebsiteContentMangementModel> WebsiteContentMangementList = [];
  TextEditingController title = TextEditingController();
  TextEditingController titleEn = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController contentEn = TextEditingController();
  void GetallWebsiteContentMangement() {
    emit(WebsiteContentMangementLoading());
    DioHelper.getData(
      url: "WebsiteContentMangement/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallWebsiteContentMangement');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(WebsiteContentMangementFail());
      } else {
        WebsiteContentMangementList = List.of(data)
            .map((e) => WebsiteContentMangementModel.fromJson(e))
            .toList();
        Utility.myPrintX(WebsiteContentMangementList.length);
        emit(WebsiteContentMangementSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallWebsiteContentMangementEror');
      Utility.myPrintX(onError.toString());

      emit(WebsiteContentMangementFail());
      // throw onError;
    });
  }

  WebsiteContentMangementModel WebsiteContentMangementbyIdModel =
      WebsiteContentMangementModel(
          id: 0,
          title: '',
          titleEn: '',
          image: '',
          Showinpage: '',
          content: '',
          contentEn: '');
  Map<String, dynamic> WebsiteContentMangementdata = {};
  Future<void> GetWebsiteContentMangementbyid({required int id}) async {
    emit(GetWebsiteContentMangementByIdLoading());
    await DioHelper.getData(
        url: "WebsiteContentMangement/GetById",
        qurey: {'id': id}).then((value) {
      Utility.myPrintX('GetWebsiteContentMangementbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      WebsiteContentMangementdata = value.data['data'];
      Utility.myPrintX(WebsiteContentMangementdata);
      if (value.data['statusCode'] != 200) {
        emit(GetWebsiteContentMangementByIdFail());
      } else {
        WebsiteContentMangementbyIdModel =
            WebsiteContentMangementModel.fromJson(WebsiteContentMangementdata);

        emit(GetWebsiteContentMangementByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetWebsiteContentMangementbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetWebsiteContentMangementByIdFail());
      throw onError;
    });
  }

  void RemoveWebsiteContentMangement(
      {required int WebsiteContentMangementId, required int index}) {
    emit(RemoveWebsiteContentMangementLoading());

    DioHelper.DeleteData(
        url: 'WebsiteContentMangement/DeleteWebsiteContentMangement',
        qurey: {'id': WebsiteContentMangementId}).then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveWebsiteContentMangement');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemoveWebsiteContentMangementFail');
        emit(RemoveWebsiteContentMangementFail());
      } else {
        WebsiteContentMangementList.removeAt(index);

        emit(RemoveWebsiteContentMangementSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveWebsiteContentMangement error');
      Utility.myPrintX(onError.toString());
      emit(RemoveWebsiteContentMangementFail());
      // throw onError;
    });
  }

  File? selectedimagefile;
  Uint8List? selectedImageUnit8List;
  // String? filePath;
  XFile? selectedImageXFile;
  Future<void> PickImage() async {
    selectedImageXFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (selectedImageXFile != null) {
      selectedimagefile = File(selectedImageXFile!.path);
      final selectedImage = await selectedImageXFile!.readAsBytes();
      selectedImageUnit8List ??= selectedImage;

      print('selectedLogo');
      print(selectedImageUnit8List);
      emit(UploadImage());
    }
  }

  Future<void> AddWebsiteContentMangement(
      {required AddWebsiteContentMangementModel websiteContentMangementModel,required AddWebsiteContentMangementimage addWebsiteContentMangementimage}) async {
    Utility.myPrintX(
        AddWebsiteContentMangementModel.postToJson(websiteContentMangementModel));
    emit(AddWebsiteContentMangementLoading());
    await DioHelper.postData(
      query:  AddWebsiteContentMangementModel.postToJson(
          websiteContentMangementModel),
            url: "WebsiteContentMangement/AddUpdate",
            data: AddWebsiteContentMangementimage.postToJson(
                addWebsiteContentMangementimage))
        .then((response) {
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> WebsiteContentMangementData = response.data;
      if (WebsiteContentMangementData["statusCode"] != 200) {
        Utility.myPrintX('Addpartner FAil');

        emit(AddWebsiteContentMangementFail());
      } else {
        emit(AddWebsiteContentMangementSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX(onError.toString());
      emit(AddWebsiteContentMangementFail());
      throw onError;
    });
  }

  Future<void> EditWebsiteContentMangement(
      WebsiteContentMangementModel websiteContentMangementModel) async {
    title.text = websiteContentMangementModel.title ?? '';
    titleEn.text = websiteContentMangementModel.titleEn ?? '';
    content.text = websiteContentMangementModel.content ?? '';
    contentEn.text = websiteContentMangementModel.contentEn ?? '';

    emit(EditwebsiteContentMangementstate());
  }

  Future<void> RemoveData() async {
    title.clear();
    titleEn.clear();
    content.clear();
    contentEn.clear();

    emit(RemoveDataState());
  }
}
