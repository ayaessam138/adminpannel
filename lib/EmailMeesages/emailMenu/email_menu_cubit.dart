import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/EmailMeesages/emailMenu/emailMenuModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'email_menu_state.dart';

class EmailMenuCubit extends Cubit<EmailMenuState> {
  EmailMenuCubit() : super(EmailMenuInitial());
  TextEditingController name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Mobile = TextEditingController();
  TextEditingController CompanyNmae = TextEditingController();
  TextEditingController Message = TextEditingController();
  TextEditingController EmailGroup = TextEditingController();
  List<EmailMenuModel> EmailMenuList = [];
  void GetallEmailMenu() {
    emit(EmailMenuLoading());
    DioHelper.getData(
      url: "EmailMenu/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallEmailMenuy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(EmailMenuFail());
      } else {
        EmailMenuList =
            List.of(data).map((e) => EmailMenuModel.fromJson(e)).toList();
        Utility.myPrintX(EmailMenuList.length);
        emit(EmailMenuSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallEmailMenuyEror');
      Utility.myPrintX(onError.toString());

      emit(EmailMenuFail());
      // throw onError;
    });
  }

  EmailMenuModel EmailMenubyIdModel = EmailMenuModel(
      id: 0, name: '', email: '', mobile: '', companyName: '', emailGroup: '');
  Map<String, dynamic> EmailMenudata = {};
  Future<void> GetEmailMenubyid({required int id}) async {
    emit(GetEmailMenuByIdLoading());
    await DioHelper.getData(url: "EmailMenu/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetEmailMenubyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      EmailMenudata = value.data['data'];
      Utility.myPrintX(EmailMenudata);
      if (value.data['statusCode'] != 200) {
        emit(GetEmailMenuByIdFail());
      } else {
        EmailMenubyIdModel = EmailMenuModel.fromJson(EmailMenudata);

        emit(GetEmailMenuByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetEmailMenubyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetEmailMenuByIdFail());
      throw onError;
    });
  }

  void RemoveEmailMenu({required int EmailMenuId, required int index}) {
    emit(RemoveEmailMenuLoading());

    DioHelper.DeleteData(
        url: 'EmailMenu/DeleteEmailMenu',
        qurey: {'id': EmailMenuId}).then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveEmailMenu');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemoveEmailMenuFail');
        emit(RemoveEmailMenuFail());
      } else {
        EmailMenuList.removeAt(index);

        emit(RemoveEmailMenuSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveEmailMenu error');
      Utility.myPrintX(onError.toString());
      emit(RemoveEmailMenuFail());
      // throw onError;
    });
  }
  Future<void> AddEmailMenu({required EmailMenuModel emailMenuModel})async {
    Utility.myPrintX(EmailMenuModel.postToJson(emailMenuModel));
    emit(AddEmailMenuLoading());
    await   DioHelper.postData(
        url: "EmailMenu/AddUpdate", data: EmailMenuModel.postToJson(emailMenuModel))
        .then((response) {
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> EmailMenuData = response.data;
      if (EmailMenuData["statusCode"] != 200) {
        Utility.myPrintX('Addpartner FAil');

        emit(AddEmailMenuFail());
      } else {
        emit(AddEmailMenuSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX(onError.toString());
      emit(AddEmailMenuFail());
      throw onError;
    });
  }
  Future<void> EditEmailMenu(EmailMenuModel emailMenuModel) async {
    name.text = emailMenuModel.name ?? '';
    Email.text = emailMenuModel.email ?? '';
    Mobile.text = emailMenuModel.mobile ?? '';
    CompanyNmae.text = emailMenuModel.companyName ?? '';
    Message.text = emailMenuModel.Message ?? '';

    emit(EditEmailMenustate());
  }

  Future<void> RemoveData() async {
    name.clear();
    Email.clear();
    Mobile.clear();
    CompanyNmae.clear();
    Message.clear();

    emit(RemoveDataState());
  }
}
