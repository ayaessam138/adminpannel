import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/EmailMeesages/emaillistgroups/EmaillistgroupsModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'email_list_grpoup_state.dart';

class EmailListGrpoupCubit extends Cubit<EmailListGrpoupState> {
  EmailListGrpoupCubit() : super(EmailListGrpoupInitial());
  TextEditingController GroupTitle = TextEditingController();
  List<EmailListGrpoupModel> EmailListGrpoupList = [];
  void GetallEmailListGrpoup() {
    emit(EmailListGrpoupLoading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallEmailListGrpoupy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(EmailListGrpoupFail());
      } else {
        EmailListGrpoupList =
            List.of(data).map((e) => EmailListGrpoupModel.fromJson(e)).toList();
        Utility.myPrintX(EmailListGrpoupList.length);
        emit(EmailListGrpoupSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallEmailListGrpoupyEror');
      Utility.myPrintX(onError.toString());

      emit(EmailListGrpoupFail());
      // throw onError;
    });
  }

  EmailListGrpoupModel EmailListGrpoupbyIdModel =
      EmailListGrpoupModel(id: 0, Groupname: '');
  Map<String, dynamic> EmailListGrpoupdata = {};
  Future<void> GetEmailListGrpoupbyid({required int id}) async {
    emit(GetEmailListGrpoupByIdLoading());
    await DioHelper.getData(url: "EmailListGrpoup/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetEmailListGrpoupbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      EmailListGrpoupdata = value.data['data'];
      Utility.myPrintX(EmailListGrpoupdata);
      if (value.data['statusCode'] != 200) {
        emit(GetEmailListGrpoupByIdFail());
      } else {
        EmailListGrpoupbyIdModel =
            EmailListGrpoupModel.fromJson(EmailListGrpoupdata);

        emit(GetEmailListGrpoupByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetEmailListGrpoupbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetEmailListGrpoupByIdFail());
      throw onError;
    });
  }

  void RemoveEmailListGrpoup(
      {required int EmailListGrpoupId, required int index}) {
    emit(RemoveEmailListGrpoupLoading());

    DioHelper.DeleteData(
        url: 'EmailListGrpoup/DeleteEmailListGrpoup',
        qurey: {'id': EmailListGrpoupId}).then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveEmailListGrpoup');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemoveEmailListGrpoupFail');
        emit(RemoveEmailListGrpoupFail());
      } else {
        EmailListGrpoupList.removeAt(index);

        emit(RemoveEmailListGrpoupSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveEmailListGrpoup error');
      Utility.myPrintX(onError.toString());
      emit(RemoveEmailListGrpoupFail());
      // throw onError;
    });
  }

  Future<void> AddEmailListGrpoup(
      {required EmailListGrpoupModel emailListGrpoupModel}) async {
    Utility.myPrintX(EmailListGrpoupModel.postToJson(emailListGrpoupModel));
    emit(AddEmailListGrpoupLoading());
    await DioHelper.postData(
            url: "EmailListGrpoup/AddUpdate",
            data: EmailListGrpoupModel.postToJson(emailListGrpoupModel))
        .then((response) {
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> EmailListGrpoupData = response.data;
      if (EmailListGrpoupData["statusCode"] != 200) {
        Utility.myPrintX('Addpartner FAil');

        emit(AddEmailListGrpoupFail());
      } else {
        emit(AddEmailListGrpoupSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX(onError.toString());
      emit(AddEmailListGrpoupFail());
      throw onError;
    });
  }

  Future<void> EditEmailListGrpoup(EmailListGrpoupModel EmailListGrpoupModel) async {
    GroupTitle.text = EmailListGrpoupModel.Groupname ?? '';


    emit(EditEmailListGrpoupstate());
  }

  Future<void> RemoveData() async {
    GroupTitle.clear();


    emit(RemoveDataState());
  }
}
