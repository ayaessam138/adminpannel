import 'package:afcooadminpanel/ContactUs/ContactUs_Model.dart';
import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());
  List <ContactUsModel> ContactUsList=[];
  void GetallContactUs() {
    emit(ContactUsLoading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallContactUsy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(ContactUsFail());
      } else {
        ContactUsList = List.of(data).map((e) => ContactUsModel.fromJson(e)).toList();
        Utility.myPrintX(ContactUsList.length);
        emit(ContactUsSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallContactUsyEror');
      Utility.myPrintX(onError.toString());

      emit(ContactUsFail());
      // throw onError;
    });
  }

  ContactUsModel ContactUsbyIdModel =
  ContactUsModel(id: 0, name: '', ceratedAt: '', mobile: '', city: '', email: '', status: '');
  Map<String, dynamic> ContactUsdata = {};
  Future<void> GetContactUsbyid({required int id}) async {
    emit(GetContactUsByIdLoading());
    await DioHelper.getData(
        url: "ContactUs/GetById",
        qurey: {'id': id}).then((value) {
      Utility.myPrintX('GetContactUsbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      ContactUsdata = value.data['data'];
      Utility.myPrintX(ContactUsdata);
      if (value.data['statusCode'] != 200) {
        emit(GetContactUsByIdFail());
      } else {
        ContactUsbyIdModel =
            ContactUsModel.fromJson(ContactUsdata);

        emit(GetContactUsByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetContactUsbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetContactUsByIdFail());
      throw onError;
    });
  }

  void RemoveContactUs(
      {required int ContactUsId, required int index}) {
    emit(RemoveContactUsLoading());

    DioHelper.DeleteData(
        url: 'ContactUs/DeleteContactUs',
        qurey: {'id': ContactUsId}).then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveContactUs');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemoveContactUsFail');
        emit(RemoveContactUsFail());
      } else {
        ContactUsList.removeAt(index);

        emit(RemoveContactUsSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveContactUs error');
      Utility.myPrintX(onError.toString());
      emit(RemoveContactUsFail());
      // throw onError;
    });
  }

}
