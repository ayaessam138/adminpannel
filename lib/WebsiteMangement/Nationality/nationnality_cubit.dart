import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/WebsiteMangement/Nationality/nationalityModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'nationnality_state.dart';

class NationnalityCubit extends Cubit<NationnalityState> {
  NationnalityCubit() : super(NationnalityInitial());
  TextEditingController name = TextEditingController();
  TextEditingController nameEn = TextEditingController();
  TextEditingController ItemOrder = TextEditingController();
  String selectedOption = '';
  List<NationalityModel> NationalityList = [];
  void GetallNationality() {
    emit(Nationnalityloading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallNationality');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(NationnalityFail());
      } else {
        NationalityList =
            List.of(data).map((e) => NationalityModel.fromJson(e)).toList();
        Utility.myPrintX(NationalityList.length);
        emit(NationnalitySucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallNationalityEror');
      Utility.myPrintX(onError.toString());

      emit(NationnalityFail());
      // throw onError;
    });
  }

  NationalityModel NationnalitybyIdModel =
      NationalityModel(id: 0, name: '', nameEn: '', status: 0, sortAt: 0);
  Map<String, dynamic> Nationnalitydata = {};
  Future<void> GetNationnalitybyid({required int id}) async {
    emit(GetNationnalityByIdLoading());
    await DioHelper.getData(url: "Nationnality/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetNationnalitybyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Nationnalitydata = value.data['data'];
      Utility.myPrintX(Nationnalitydata);
      if (value.data['statusCode'] != 200) {
        emit(GetNationnalityByIdFail());
      } else {
        NationnalitybyIdModel = NationalityModel.fromJson(Nationnalitydata);

        emit(GetNationnalityByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetNationnalitybyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetNationnalityByIdFail());
      throw onError;
    });
  }

  void RemoveNationnality({required int NationnalityId, required int index}) {
    emit(RemoveNationnalityLoading());

    DioHelper.DeleteData(
        url: 'Nationnality/DeleteNationnality',
        qurey: {'id': NationnalityId}).then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveNationnality');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemoveNationnalityFail');
        emit(RemoveNationnalityFail());
      } else {
        NationalityList.removeAt(index);

        emit(RemoveNationnalitySucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveNationnality error');
      Utility.myPrintX(onError.toString());
      emit(RemoveNationnalityFail());
      // throw onError;
    });
  }

  SelectRadioButton(value) {
    selectedOption = value;
    emit(SelectOption());
  }

  int ItemOrderCounter = 0;
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

  Future<void> EditNationnality(NationalityModel NationnalityModel) async {
    name.text = NationnalityModel.name ?? '';
    nameEn.text = NationnalityModel.nameEn ?? '';

    ItemOrder.text = NationnalityModel.sortAt.toString() ?? '';
    selectedOption = NationnalityModel.status == 1 ? 'Posted' : 'NotPosted';
    emit(EditNationnalitystate());
  }

  Future<void> RemoveData() async {
    name.clear();
    nameEn.clear();
    ;
    ItemOrder.clear();
    selectedOption = '';
    emit(RemoveDataState());
  }
}
