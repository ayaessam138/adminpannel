import 'dart:io';
import 'dart:typed_data';

import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/Features/FeaturesModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'features_state.dart';

class FeaturesCubit extends Cubit<FeaturesState> {
  FeaturesCubit() : super(FeaturesInitial());
  TextEditingController title = TextEditingController();
  TextEditingController titleEn = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController contentEn = TextEditingController();
  TextEditingController SortAt = TextEditingController();
  List<FeaturesModel> FeaturesList = [];
  void GetallFeatures() {
    emit(FeaturesLoading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallFeaturesy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(FeaturesFail());
      } else {
        FeaturesList =
            List.of(data).map((e) => FeaturesModel.fromJson(e)).toList();
        Utility.myPrintX(FeaturesList.length);
        emit(FeaturesSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallFeaturesyEror');
      Utility.myPrintX(onError.toString());

      emit(FeaturesFail());
      // throw onError;
    });
  }

  FeaturesModel FeaturesbyIdModel = FeaturesModel(
    id: 0,
    title: '',
    titleEn: '',
    status: 0,
    image: '',
    Content: '',
    ContentEn: '',
    SortAt: 0,
  );
  Map<String, dynamic> Featuresdata = {};
  Future<void> GetFeaturesbyid({required int id}) async {
    emit(GetFeaturesByIdLoading());
    await DioHelper.getData(url: "Features/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetFeaturesbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Featuresdata = value.data['data'];
      Utility.myPrintX(Featuresdata);
      if (value.data['statusCode'] != 200) {
        emit(GetFeaturesByIdFail());
      } else {
        FeaturesbyIdModel = FeaturesModel.fromJson(Featuresdata);

        emit(GetFeaturesByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetFeaturesbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetFeaturesByIdFail());
      throw onError;
    });
  }

  void RemoveFeatures({required int FeaturesId, required int index}) {
    emit(RemoveFeaturesLoading());

    DioHelper.DeleteData(
        url: 'Features/DeleteFeatures',
        qurey: {'id': FeaturesId}).then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveFeatures');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemoveFeaturesFail');
        emit(RemoveFeaturesFail());
      } else {
        FeaturesList.removeAt(index);

        emit(RemoveFeaturesSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveFeatures error');
      Utility.myPrintX(onError.toString());
      emit(RemoveFeaturesFail());
      // throw onError;
    });
  }

  Future<void> AddFeatures(
      FeaturesModel featuresModel, AddFeaturesimage addFeaturesimage) async {
    Utility.myPrintX(FeaturesModel.postToJson(featuresModel));
    emit(AddFeaturesLoading());
    await DioHelper.postData(
            data: AddFeaturesimage.postToJson(addFeaturesimage),
            url: "Features/AddUpdate",
            query: FeaturesModel.postToJson(featuresModel))
        .then((response) {
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> FeaturesData = response.data;
      if (FeaturesData["statusCode"] != 200) {
        Utility.myPrintX('Addpartner FAil');

        emit(AddFeaturesFail());
      } else {
        emit(AddFeaturesSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX(onError.toString());
      emit(AddFeaturesFail());
      throw onError;
    });
  }

  String selectedOption = '';
  SelectRadioButton(value) {
    selectedOption = value;
    emit(SelectOption());
  }

  Future<void> EditFeatures(FeaturesModel featuresModel) async {
    title.text = featuresModel.title ?? '';
    titleEn.text = featuresModel.titleEn ?? '';
    content.text = featuresModel.Content ?? '';
    contentEn.text = featuresModel.ContentEn ?? '';
    SortAt.text = featuresModel.SortAt.toString() ?? '';
    selectedOption = featuresModel.status == 1 ? 'Posted' : 'NotPosted';

    emit(EditFeaturesstate());
  }

  Future<void> RemoveData() async {
    title.clear();
    titleEn.clear();
    content.clear();
    contentEn.clear();
    contentEn.clear();
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
