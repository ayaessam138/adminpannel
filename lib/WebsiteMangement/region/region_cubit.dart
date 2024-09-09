import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/regionModel.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'region_state.dart';

class RegionCubit extends Cubit<RegionState> {
  RegionCubit() : super(RegionInitial());
  List<RegionModel> RegionList = [];
  List<RegionModel> RegionpartnerList = [];
  RegionModel regionModel =
      RegionModel(id: 0, name: '', nameEn: '', status: 0, sortAt: 0);
  RegionModel RegionbyIdModel =
      RegionModel(id: 0, name: '', nameEn: '', status: 0, sortAt: 0);
  RegionModel regionPartnerModel =
      RegionModel(id: 0, name: '', nameEn: '', status: 0, sortAt: 0);
  RegionModel? regionModelobj;

  TextEditingController name = TextEditingController();
  TextEditingController nameEn = TextEditingController();
  TextEditingController sortAt = TextEditingController();

  String selectedOption = '';

  Future<List<RegionModel>> GetallRegions() async {
    emit(GetRegionLoading());
    await DioHelper.getData(
      url: "Region/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallRegion');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(GetRegionFail());
        return [];
      } else {
        RegionList = List.of(data).map((e) => RegionModel.fromJson(e)).toList();
        Utility.myPrintX(RegionList.length);
        emit(GetRegionSucess());
        return RegionList;
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallRegionEror');
      Utility.myPrintX(onError.toString());

      emit(GetRegionFail());

      return [];
    });

    return RegionList;
  }

  Future<List<RegionModel>> GetallRegionsPartner() async {
    emit(GetRegionpartnerLoading());
    await DioHelper.getData(
      url: "Region/GetAllRegionPartner",
    ).then((value) {
      Utility.myPrintX('GetallRegionsPartner');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(GetRegionpartnerFail());
        return [];
      } else {
        RegionpartnerList =
            List.of(data).map((e) => RegionModel.fromJson(e)).toList();
        if (RegionpartnerList.length > 0)
          regionPartnerModel = RegionpartnerList[0];
        Utility.myPrintX(RegionpartnerList.length);
        emit(GetRegionpartnerSucess());
        return RegionpartnerList;
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallRegionsPartner Eror');
      Utility.myPrintX(onError.toString());

      emit(GetRegionpartnerFail());

      return [];
    });

    return RegionpartnerList;
  }

  Map<String, dynamic> Regiondata = {};

  Future<void> GetRegionbyid({required int id}) async {
    emit(GetRegionByIdLoading());
    await DioHelper.getData(url: "Region/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetRegionbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Regiondata = value.data['data'];
      Utility.myPrintX(Regiondata);
      if (value.data['statusCode'] != 200) {
        emit(GetRegionByIdFail());
      } else {
        RegionbyIdModel = RegionModel.fromJson(Regiondata);

        emit(GetRegionByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetRegionbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetRegionByIdFail());
      throw onError;
    });
  }

  void RemoveRegion({required int RegionId, required int index}) {
    emit(RemoveRegionLoading());

    DioHelper.DeleteData(url: 'Region/DeleteRegion', qurey: {'id': RegionId})
        .then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveRegion');
      Utility.myPrintX(data);
      if (data['statusCode'] != 200) {
        Utility.myPrintX('RemoveRegionFail');
        emit(RemoveRegionFail());
      } else {
        RegionList.removeAt(index);

        emit(RemoveRegionSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveRegion error');
      Utility.myPrintX(onError.toString());
      emit(RemoveRegionFail());
      throw onError;
    });
  }

 Future <void >AddRegion(RegionModel regionModel)async {
    Utility.myPrintX(RegionModel.postToJson(regionModel));
    emit(AddRegionLoading());
    await DioHelper.postData(
            url: "Region/AddUpdate", data: RegionModel.postToJson(regionModel))
        .then((response) {
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> RegionData = response.data;
      if (RegionData["statusCode"] != 200) {
        Utility.myPrintX('Addpartner FAil');

        emit(AddRegionFail());
      } else {
        emit(AddRegionSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX(onError.toString());
      emit(AddRegionFail());
      throw onError;
    });
  }

  void ChangeState() {
    emit(StateChanged());
  }

  SelectRadioButton(value) {
    selectedOption = value;
    emit(SelectOption());
  }

  Future<void> EditRegion(RegionModel region) async {
    name.text = region.name ?? '';
    nameEn.text = region.nameEn ?? '';
    sortAt.text = region.sortAt.toString() ?? '';
    selectedOption=region.status==1?'Posted':'NotPosted';
    emit(EditRegionState());
  }
  Future<void> RemoveData() async {
    name.clear();
    nameEn.clear();
    sortAt.clear();
    selectedOption = '';
    emit(RemoveDataState());
  }
}
