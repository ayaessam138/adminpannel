import 'dart:io';
import 'dart:typed_data';

import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';

import 'package:afcooadminpanel/WebsiteMangement/cardfield/cardfieldModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'card_field_state.dart';

class CardFieldCubit extends Cubit<CardFieldState> {
  CardFieldCubit() : super(CardFieldInitial());
  TextEditingController title=TextEditingController();
  TextEditingController titleEn=TextEditingController();
  TextEditingController content=TextEditingController();
  TextEditingController contentEn=TextEditingController();
  TextEditingController ItemOrder=TextEditingController();
  List<CardFieldModel> CardFieldPartnerList = [];
  List<CardFieldModel> CardFieldList = [];
  String selectedOption='';
  CardFieldModel cardFieldModel = CardFieldModel(
      id: 0,
      title: '',
      titleEn: '',
      image: '',
      icon: '',
      sortAt: 0,
      status: 0,
      content: '',
      contentEn: '');
  CardFieldModel? cardFieldModelobj;
  double _textFieldWidth = 200.0;
  double _textFieldHeight = 100.0;
  Future<List<CardFieldModel>> GetallCardFieldsPartner() async {
    emit(GetCardFieldpartnerLoading());
    await DioHelper.getData(
      url: "Cate/GetAllCatePartner",
    ).then((value) {
      Utility.myPrintX('Getall CardFieldscardField');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(GetCardFieldpartnerFail());
        return [];
      } else {
        CardFieldPartnerList =
            List.of(data).map((e) => CardFieldModel.fromJson(e)).toList();
        if (CardFieldPartnerList.length > 0)
          cardFieldModel = CardFieldPartnerList[0];
        Utility.myPrintX(CardFieldPartnerList.length);
        emit(GetCardFieldpartnerSucess());
        return CardFieldPartnerList;
      }
    }).catchError((onError) {
      Utility.myPrintX('Getall CardFieldscardField Eror');
      Utility.myPrintX(onError.toString());
      emit(GetCardFieldpartnerFail());

      return [];
    });

    return CardFieldPartnerList;
  }

  Future<List<CardFieldModel>> GetallCardFields() async {
    emit(GetallCardFieldLoading());
    await DioHelper.getData(
      url: "Cate/GetAll",
    ).then((value) {
      Utility.myPrintX('Getall CardFieldscardField');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(GetallCardFieldFail());
        return [];
      } else {
        CardFieldList =
            List.of(data).map((e) => CardFieldModel.fromJson(e)).toList();

        Utility.myPrintX(CardFieldList.length);
        emit(GetallCardFieldSucess());
        return CardFieldList;
      }
    }).catchError((onError) {
      Utility.myPrintX('Getall CardFieldscardField Eror');
      Utility.myPrintX(onError.toString());

      emit(GetallCardFieldFail());

      return [];
    });

    return CardFieldList;
  }

  CardFieldModel? cardFieldbyIdModel=CardFieldModel(
      id: 0,
      title: '',
      titleEn: '',
      image: '',
      icon: 'icon',
      sortAt: 0,
      status: 0,
      content: '',
      contentEn: ''
  );
  Map<String, dynamic> cardFielddata = {};
  Future<void> GetcardFieldbyid({required int id}) async {
    emit(GetcardFieldByIdLoading());
    await DioHelper.getData(url: "Cate/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetcardFieldbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      cardFielddata = value.data['data'];
      Utility.myPrintX(cardFielddata);
      if (value.data['statusCode'] != 200) {
        emit(GetcardFieldByIdFail());
      } else {
        cardFieldbyIdModel = CardFieldModel.fromJson(cardFielddata);

        emit(GetcardFieldByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetcardFieldbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetcardFieldByIdFail());
      throw onError;
    });
  }

  void RemovecardField({required int cardFieldId, required int index}) {
    emit(RemovecardFieldLoading());

    DioHelper.DeleteData(url: 'Cate/DeleteCate', qurey: {'id': cardFieldId})
        .then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemovecardField');
      Utility.myPrintX(data);
      if (data['statusCode'] != 200) {
        Utility.myPrintX('RemovecardFieldFail');
        emit(RemovecardFieldFail());
      } else {
        CardFieldList.removeAt(index);

        emit(RemovecardFieldSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemovecardField error');
      Utility.myPrintX(onError.toString());
      emit(RemovecardFieldFail());
      throw onError;
    });
  }

  void AddcardField(
      {required CardFieldModel cardFieldModel,
        required AddcardFieldimage addcardFieldimage}) async {
    Utility.myPrintX(CardFieldModel.postToJson(cardFieldModel));
    Utility.myPrintX(AddcardFieldimage.postToJson(addcardFieldimage).toString());
    emit(AddcardFieldLoading());

    DioHelper.postDataFormat(
        query: CardFieldModel.postToJson(cardFieldModel),
        url: "cardField/AddUpdate",
        data: AddcardFieldimage.postToJson(addcardFieldimage))
        .then((response) {
      Utility.myPrintX('AddcardField');
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> cardFielddata = response.data;

      if (cardFielddata["statusCode"] != 200) {
        Utility.myPrintX('AddcardFieldFAil');

        emit(AddcardFieldFail());
      } else {
        emit(AddcardFieldSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('AddcardFielderror');
      Utility.myPrintX(onError.toString());

      emit(AddcardFieldFail());
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
int ItemOrderCounter=0;
  SaveItemOrderCount(value) {
    ItemOrder.text = value;
    ItemOrderCounter = int.parse(value);
    emit(SaveItemOrderCounter());
  }

  IncrementItemOrderCounter() {
    ItemOrderCounter++;
    ItemOrder.text = ItemOrderCounter.toString();
    print(ItemOrderCounter);
    emit(IncItemOrderCounter());
  }

  DecrementItemOrderCounter() {
    if (ItemOrderCounter > 0) ItemOrderCounter--;
    ItemOrder.text = ItemOrderCounter.toString();
    emit(DecItemOrderCounter());
  }
  void ChangeState() {
    emit(StateChanged());
  }


  Future<void> EditCardField(CardFieldModel cardFieldModel)async {
    title.text=cardFieldModel.title??'';
    titleEn.text=cardFieldModel.titleEn??'';
    content.text=cardFieldModel.content??'';
    contentEn.text=cardFieldModel.contentEn??'';
    ItemOrder.text=cardFieldModel.sortAt.toString()??'';
    selectedOption=cardFieldModel.status==1?'Posted':'NotPosted';
    emit(EditCardFieldstate());
  }
  Future<void> RemoveData() async {
    title.clear();
    titleEn.clear();
    content.clear();
    contentEn.clear();
    ItemOrder.clear();
    selectedOption = '';
    emit(RemoveDataState());
  }

  changesize({required DragUpdateDetails deatils}){
    _textFieldWidth += deatils.delta.dx;
    _textFieldHeight += deatils.delta.dy;
    emit(SizeChanged());
  }
}
