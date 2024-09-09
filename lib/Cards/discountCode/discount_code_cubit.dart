import 'package:afcooadminpanel/Cards/discountCode/discountCodeModel.dart';

import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'discount_code_state.dart';

class DiscountCodeCubit extends Cubit<DiscountCodeState> {
  DiscountCodeCubit() : super(DiscountCodeInitial());
  TextEditingController name = TextEditingController();
  TextEditingController disCountPercentage = TextEditingController();
  TextEditingController StartDate = TextEditingController();
  TextEditingController EndDate = TextEditingController();
  String selectedOption='';
  List <DisCountCodeModel> DisCountCodeList=[];
  void GetallDisCountCode() {
    emit(DisCountCodeLoading());
    DioHelper.getData(
      url: "DiscountCode/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallDisCountCodey');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(DisCountCodeFail());
      } else {
        DisCountCodeList = List.of(data).map((e) => DisCountCodeModel.fromJson(e)).toList();
        Utility.myPrintX(DisCountCodeList.length);
        emit(DisCountCodeSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallDisCountCodeyEror');
      Utility.myPrintX(onError.toString());

      emit(DisCountCodeFail());
      throw onError;
    });
  }

  DisCountCodeModel DiscountCodebyIdModel =
DisCountCodeModel(id: 0, name: '', startDate: '', endDate: '', discountValue: 0, discountType: 0);
  Map<String, dynamic> DiscountCodedata = {};
  Future<void> GetDiscountCodebyid({required int id}) async {
    emit(GetDiscountCodeByIdLoading());
    await DioHelper.getData(
        url: "DiscountCode/GetById",
        qurey: {'id': id}).then((value) {
      Utility.myPrintX('GetDiscountCodebyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      DiscountCodedata = value.data['data'];
      Utility.myPrintX(DiscountCodedata);
      if (value.data['statusCode'] != 200) {
        emit(GetDiscountCodeByIdFail());
      } else {
        DiscountCodebyIdModel =
            DisCountCodeModel.fromJson(DiscountCodedata);

        emit(GetDiscountCodeByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetDiscountCodebyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetDiscountCodeByIdFail());
      throw onError;
    });
  }

  void RemoveDiscountCode(
      {required int DiscountCodeId, required int index}) {
    emit(RemoveDiscountCodeLoading());

    DioHelper.DeleteData(
        url: 'DiscountCode/DeleteDiscountCode',
        qurey: {'id': DiscountCodeId}).then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveDiscountCode');
      Utility.myPrintX(data);
      if (data['statusCode'] != 200) {
        Utility.myPrintX('RemoveDiscountCodeFail');
        emit(RemoveDiscountCodeFail());
      } else {
        DisCountCodeList.removeAt(index);

        emit(RemoveDiscountCodeSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveDiscountCode error');
      Utility.myPrintX(onError.toString());
      emit(RemoveDiscountCodeFail());
      // throw onError;
    });
  }


  void AddDisCountCode(DisCountCodeModel disCountCodeModel) {
    Utility.myPrintX(DisCountCodeModel.postToJson(disCountCodeModel));
    emit(AddDisCountCodeLoading());
    DioHelper.postData(
        url: "DisCountCode/AddUpdate",
        data: DisCountCodeModel.postToJson(disCountCodeModel))
        .then((response) {
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> DisCountCodeData = response.data;
      if (DisCountCodeData["statusCode"] != 200) {
        Utility.myPrintX('AddDisCountCode FAil');

        emit(AddDisCountCodeFail());
      } else {
        emit(AddDisCountCodeSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX(onError.toString());
      emit(AddDisCountCodeFail());
      throw onError;
    });
  }


  SelectRadioButton(value) {
    selectedOption = value;
    emit(SelectOption());
  }

  String formattedate2 = '';
  Future<String> ShowDatePicker(
      BuildContext context, TextEditingController Controller) async {
    String formattedate = '';
    final SelectedDate = await showDatePicker(

      keyboardType: TextInputType.multiline,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1000),
      lastDate: DateTime(2029),
    );
    DateTime selectedDateTime = DateTime(
      SelectedDate?.year ?? 0,
      SelectedDate?.month ?? 0,
      SelectedDate?.day ?? 0,
      0,
      0, // Set seconds to zero
    );
    if (SelectedDate != null) {
      var dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ");
      var dateFormat2 = DateFormat("yyyy-MM-dd");
      formattedate = dateFormat.format(selectedDateTime);
      formattedate2 = dateFormat2.format(selectedDateTime);
      Controller.text = formattedate2.toString();
      Utility.myPrintX('object');
      Utility.myPrintX(formattedate.toString());
      emit(PickDate());

      // onChangeDate?.call(formattedate);
    }
    return formattedate;
  }
}
