import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';

import 'package:afcooadminpanel/service/service_Model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());
  TextEditingController name = TextEditingController();
  TextEditingController nameEn = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController discountPrice = TextEditingController();
  TextEditingController DiscountPercentage = TextEditingController();
  TextEditingController sortAt = TextEditingController();
  ServiceModel serviceModel = ServiceModel(
      id: 0,
      title: '',
      titleEn: '',
      image: '',
      sortAt: 0,
      status: 0,
      isMedical: true);
  List<String> Status = ['Posted', 'NotPosted'];
  List<String> DisCountType = ['Percentage', 'fixed amount'];
  ServiceModel? serviceModelobj;
  List<ServiceModel> ServicepartnerList = [];
  int DiscountPercentageCounter = 0;
  Future<List<ServiceModel>> getallServicesPartner() async {
    emit(GetServicePartnerLoading());
    await DioHelper.getData(
      url: "CateService/GetAllCateServicePartner",
    ).then((value) {
      Utility.myPrintX('GetallServicesPartner');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(GetServicePartnerFail());
        return [];
      } else {
        ServicepartnerList =
            List.of(data).map((e) => ServiceModel.fromJson(e)).toList();
        if (ServicepartnerList.length > 0) serviceModel = ServicepartnerList[0];
        Utility.myPrintX(ServicepartnerList.length);
        emit(GetServicePartnerSucess());
        return ServicepartnerList;
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallServicesPartner Eror');
      Utility.myPrintX(onError.toString());

      emit(GetServicePartnerFail());

      return [];
    });

    return ServicepartnerList;
  }

  List<ServiceModel> ServiceList = [];
  void GetallService() {
    emit(GetServiceLoading());
    DioHelper.getData(
      url: "CateService/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallService');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(GetServiceFail());
      } else {
        ServiceList =
            List.of(data).map((e) => ServiceModel.fromJson(e)).toList();
        Utility.myPrintX(ServiceList.length);
        emit(GetServiceSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallServiceEror');
      Utility.myPrintX(onError.toString());

      emit(GetServiceFail());
      // throw onError;
    });
  }

  ServiceModel? ServicebyIdModel = ServiceModel(
      id: 0,
      title: '',
      titleEn: '',
      image: '',
      sortAt: 0,
      status: 0,
      isMedical: false);
  Map<String, dynamic> Servicedata = {};
  Future<void> GetServicebyid({required int id}) async {
    emit(GetServiceByIdLoading());
    await DioHelper.getData(url: "CateService/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetServicebyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Servicedata = value.data['data'];
      Utility.myPrintX(Servicedata);
      if (value.data['statusCode'] != 200) {
        emit(GetServiceByIdFail());
      } else {
        ServicebyIdModel = ServiceModel.fromJson(Servicedata);

        emit(GetServiceByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetServicebyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetServiceByIdFail());
      throw onError;
    });
  }

  void RemoveService({required int ServiceId, required int index}) {
    emit(RemoveServiceLoading());

    DioHelper.DeleteData(
        url: 'CateService/DeleteCateService',
        qurey: {'id': ServiceId}).then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveService');
      Utility.myPrintX(data);
      if (data['statusCode'] != 200) {
        Utility.myPrintX('RemoveServiceFail');
        emit(RemoveServiceFail());
      } else {
        ServiceList.removeAt(index);

        emit(RemoveServiceSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveService error');
      Utility.myPrintX(onError.toString());
      emit(RemoveServiceFail());
      throw onError;
    });
  }

  SaveDiscountPercentageCount(value) {
    DiscountPercentage.text = value;
    DiscountPercentageCounter = int.parse(value);
    emit(SaveDiscountPercentageCounter());
  }

  IncrementDiscountPercentageCounter() {
    DiscountPercentageCounter++;
    DiscountPercentage.text = DiscountPercentageCounter.toString();
    print(DiscountPercentageCounter);
    emit(IncDiscountPercentageCounter());
  }

  DecrementDiscountPercentageCounter() {
    if (DiscountPercentageCounter > 0) DiscountPercentageCounter--;
    DiscountPercentage.text = DiscountPercentageCounter.toString();
    emit(DecDiscountPercentageCounter());
  }

  void ChangeState() {
    emit(StateChanged());
  }
}
