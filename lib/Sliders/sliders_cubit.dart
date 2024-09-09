import 'dart:io';
import 'dart:typed_data';

import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/Sliders/SlidersModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit() : super(SlidersInitial());

  TextEditingController title = TextEditingController();
  TextEditingController titleEn = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController contentEn = TextEditingController();
  TextEditingController SortAt = TextEditingController();
  TextEditingController Url = TextEditingController();
  String selectedOption='';
  List<SliderModel> SliderList = [];
  void GetallSlider() {
    emit(SlidersLoading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallSlidery');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(SlidersFail());
      } else {
        SliderList = List.of(data).map((e) => SliderModel.fromJson(e)).toList();
        Utility.myPrintX(SliderList.length);
        emit(SlidersSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallSlideryEror');
      Utility.myPrintX(onError.toString());

      emit(SlidersFail());
      // throw onError;
    });
  }

  SliderModel SliderbyIdModel =
      SliderModel(id: 0, title: '', titleEn: '', url: '', status: 0, image: '', content: '', contentEn: '');
  Map<String, dynamic> Sliderdata = {};
  Future<void> GetSliderbyid({required int id}) async {
    emit(GetSliderByIdLoading());
    await DioHelper.getData(url: "Slider/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetSliderbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Sliderdata = value.data['data'];
      Utility.myPrintX(Sliderdata);
      if (value.data['statusCode'] != 200) {
        emit(GetSliderByIdFail());
      } else {
        SliderbyIdModel = SliderModel.fromJson(Sliderdata);

        emit(GetSliderByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetSliderbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetSliderByIdFail());
      throw onError;
    });
  }

  void RemoveSlider({required int SliderId, required int index}) {
    emit(RemoveSliderLoading());

    DioHelper.DeleteData(url: 'Slider/DeleteSlider', qurey: {'id': SliderId})
        .then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveSlider');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemoveSliderFail');
        emit(RemoveSliderFail());
      } else {
        SliderList.removeAt(index);

        emit(RemoveSliderSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveSlider error');
      Utility.myPrintX(onError.toString());
      emit(RemoveSliderFail());
      // throw onError;
    });
  }

  void AddSliders(
      {required SliderModel sliderModel,
        required AddSlidersimage addSliderimage}) async {
    Utility.myPrintX(SliderModel.postToJson(sliderModel));
    Utility.myPrintX(AddSlidersimage.postToJson(addSliderimage).toString());
    emit(AddSliderLoading());

    DioHelper.postDataFormat(
        query: SliderModel.postToJson(sliderModel),
        url: "Slider/AddUpdate",
        data: AddSlidersimage.postToJson(addSliderimage))
        .then((response) {
      Utility.myPrintX('AddSliders');
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> Slidersdata = response.data;

      if (Slidersdata["statusCode"] != 200) {
        Utility.myPrintX('AddSlidersFAil');

        emit(AddSliderFail());
      } else {
        emit(AddSliderSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('AddSliderserror');
      Utility.myPrintX(onError.toString());

      emit(AddSliderFail());
    });
  }

  SelectRadioButton(value) {
    selectedOption = value;
    emit(SelectOption());
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

  Future<void> EditSliders(SliderModel sliderModel) async {
    title.text = sliderModel.title ?? '';
    titleEn.text = sliderModel.titleEn ?? '';
    content.text = sliderModel.content ?? '';
    contentEn.text = sliderModel.contentEn ?? '';
    SortAt.text = sliderModel.contentEn ?? '';
    selectedOption = sliderModel.status == 1 ? 'Posted' : 'NotPosted';

    emit(EditSlidersstate());
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
}
