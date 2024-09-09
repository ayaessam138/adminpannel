import 'dart:html';

import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/WebsiteMangement/cities/cityModel.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit() : super(CitiesInitial());

  TextEditingController name = TextEditingController();
  TextEditingController nameEn = TextEditingController();
  TextEditingController ItemOrder = TextEditingController();
  int ItemOrderCounter = 0;
  String selectedOption = '';
  List<CityModel> CityList = [];
  List<CityModel> CityPartnerList = [];
  CityModel? cityModelobj;
  String? City;
  CityModel cityModel =
      CityModel(id: 0, name: '', nameEn: '', status: 0, sortAt: 0, regionId: 0);
  CityModel CitybyIdModel =
      CityModel(id: 0, name: '', nameEn: '', status: 0, sortAt: 0, regionId: 0);
  bool? isAdd;
  void GetallCities() {
    emit(GetCitiesLoading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallCities');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(GetCitiesFail());
      } else {
        CityList = List.of(data).map((e) => CityModel.fromJson(e)).toList();
        Utility.myPrintX(CityList.length);
        emit(GetCitiesSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallCitiesEror');
      Utility.myPrintX(onError.toString());

      emit(GetCitiesFail());
      // throw onError;
    });
  }

  Map<String, dynamic> Citydata = {};
  Future<void> GetCitybyid({required int id}) async {
    emit(GetCityByIdLoading());
    await DioHelper.getData(url: "City/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetCitybyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Citydata = value.data['data'];
      Utility.myPrintX(Citydata);
      if (value.data['statusCode'] != 200) {
        emit(GetCityByIdFail());
      } else {
        CitybyIdModel = CityModel.fromJson(Citydata);

        emit(GetCityByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetCitybyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetCityByIdFail());
      // throw onError;
    });
  }

  Future<List<CityModel>> GetallCitiesPartner({required int regionid}) async {
    emit(GetCitiesLoading());
    await DioHelper.getData(
      qurey: {'region_id': regionid},
      url: "City/GetAllCityPartner",
    ).then((value) {
      Utility.myPrintX('GetallCitiesPartner');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        return [];
        emit(GetCitiesFail());
      } else {
        CityPartnerList =
            List.of(data).map((e) => CityModel.fromJson(e)).toList();
        Utility.myPrintX(CityPartnerList.length);
        if (CityPartnerList.length > 0) cityModel = CityPartnerList[0];

        emit(GetCitiesSucess());
        return CityPartnerList;
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallCitiesPartnerEror');
      Utility.myPrintX(onError.toString());

      emit(GetCitiesFail());
      return [];
      // throw onError;
    });
    return CityPartnerList;
  }

  void RemoveCity({required int CityId, required int index}) {
    emit(RemoveCityLoading());

    DioHelper.DeleteData(url: 'City/DeleteCity', qurey: {'id': CityId})
        .then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveCity');
      Utility.myPrintX(data);
      if (data['statusCode'] != 200) {
        Utility.myPrintX('RemoveCityFail');
        emit(RemoveCityFail());
      } else {
        CityList.removeAt(index);

        emit(RemoveCitySucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveCity error');
      Utility.myPrintX(onError.toString());
      emit(RemoveCityFail());
      throw onError;
    });
  }

  Future<void> AddCity(CityModel cityModel)async {
    Utility.myPrintX(CityModel.postToJson(cityModel));
    emit(AddCityLoading());
 await   DioHelper.postData(
            url: "City/AddUpdate", data: CityModel.postToJson(cityModel))
        .then((response) {
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> CityData = response.data;
      if (CityData["statusCode"] != 200) {
        Utility.myPrintX('Addpartner FAil');

        emit(AddCityFail());
      } else {
        emit(AddCitySucess());
      }
    }).catchError((onError) {
      Utility.myPrintX(onError.toString());
      emit(AddCityFail());
      throw onError;
    });
  }

  void Changestate() {
    emit(StateChanged());
  }

  SelectRadioButton(value) {
    selectedOption = value;
    emit(SelectOption());
  }

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

  Future<void> EditCity(CityModel City)async {
    name.text=City.name??'';
    nameEn.text=City.nameEn??'';
    ItemOrder.text=City.sortAt.toString()??'';
    selectedOption=City.status==1?'Posted':'NotPosted';
    emit(EditCitystate());
  }
  Future<void> RemoveData() async {
    name.clear();
    nameEn.clear();
    ItemOrder.clear();
    selectedOption = '';
    emit(RemoveDataState());
  }
}
