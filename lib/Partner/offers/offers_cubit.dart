import 'dart:io';
import 'dart:typed_data';

import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/Partner/offers/OffersModel.dart';
import 'package:afcooadminpanel/Partner/offers/addOfferModel.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitial());
  TextEditingController name = TextEditingController();
  TextEditingController nameEn = TextEditingController();
  TextEditingController desCription = TextEditingController();
  TextEditingController descriptonEn = TextEditingController();
  List<OffersModel> OffersList = [];
  OffersModel OfferbyIdModel = OffersModel(
      id: 0, name: '', partnername: '', nameEn: '', status: 0, image: '', description: '', descriptionEn: '');
  String selectedOption = '';
  void GetallOffers() {
    emit(OffersLoading());
    DioHelper.getData(
      url: "Offer/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallOffersy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(OffersFail());
      } else {
        OffersList = List.of(data).map((e) => OffersModel.fromJson(e)).toList();
        Utility.myPrintX(OffersList.length);
        emit(OffersSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallOffersyEror');
      Utility.myPrintX(onError.toString());

      emit(OffersFail());
      throw onError;
    });
  }

  Map<String, dynamic> Offerdata = {};
  Future<void> GetOfferbyid({required int id}) async {
    emit(GetOfferByIdLoading());
    await DioHelper.getData(url: "Offer/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetOfferbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Offerdata = value.data['data'];
      Utility.myPrintX(Offerdata);
      if (value.data['statusCode'] != 200) {
        emit(GetOfferByIdFail());
      } else {
        OfferbyIdModel = OffersModel.fromJson(Offerdata);

        emit(GetOfferByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetOfferbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetOfferByIdFail());
      throw onError;
    });
  }

  void Removeoffer({required int offerId, required int index}) {
    emit(RemoveofferLoading());

    DioHelper.DeleteData(url: 'Offer/DeleteOffer', qurey: {'id': offerId})
        .then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('Removeoffer');
      Utility.myPrintX(data);
      if (data['statusCode'] != 200) {
        Utility.myPrintX('RemoveofferFail');
        emit(RemoveofferFail());
      } else {
        OffersList.removeAt(index);

        emit(RemoveofferSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('Removeoffer error');
      Utility.myPrintX(onError.toString());
      emit(RemoveofferFail());
      throw onError;
    });
  }

  void Addofffer(
      {required OffersModel addOfferModel,
      required AddOfferimage addOfferimage}) async {
    Utility.myPrintX(OffersModel.postToJson(addOfferModel));
    Utility.myPrintX(AddOfferimage.postToJson(addOfferimage).toString());
    emit(AddOfferLoading());

    DioHelper.postDataFormat(
            query: OffersModel.postToJson(addOfferModel),
            url: "Offer/AddUpdate",
            data: AddOfferimage.postToJson(addOfferimage))
        .then((response) {
      Utility.myPrintX('Addofffer');
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> offferdata = response.data;

      if (offferdata["statusCode"] != 200) {
        Utility.myPrintX('AddoffferFAil');

        emit(AddOfferFail());
      } else {
        emit(AddOfferSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('Addofffererror');
      Utility.myPrintX(onError.toString());

      emit(AddOfferFail());
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

  Future<void> Editofffer(OffersModel offferModel) async {
    name.text = offferModel.name ?? '';
    nameEn.text = offferModel.nameEn ?? '';
    desCription.text = offferModel.description ?? '';
    descriptonEn.text = offferModel.descriptionEn ?? '';
    selectedOption = offferModel.status == 1 ? 'Posted' : 'NotPosted';

    emit(Editoffferstate());
  }

  Future<void> RemoveData() async {
    name.clear();
    nameEn.clear();
    desCription.clear();
    descriptonEn.clear();

    selectedOption = '';
    emit(RemoveDataState());
  }
}
