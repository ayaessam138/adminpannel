import 'dart:io';
import 'dart:typed_data';

import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/Customers/customersModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'customers_state.dart';

class CustomersCubit extends Cubit<CustomersState> {
  CustomersCubit() : super(CustomersInitial());
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController Mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController title = TextEditingController();
  String selectedOptionforGendervalue = '';
  String selectedOptionForAccountvalue = '';
  List<CustomersModel> CustomersList = [];
  void GetallCustomers() {
    emit(CustomersLoading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallCustomersy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(CustomersFail());
      } else {
        CustomersList =
            List.of(data).map((e) => CustomersModel.fromJson(e)).toList();
        Utility.myPrintX(CustomersList.length);
        emit(CustomersSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallCustomersyEror');
      Utility.myPrintX(onError.toString());

      emit(CustomersFail());
      // throw onError;
    });
  }

  CustomersModel CustomersbyIdModel = CustomersModel(
      id: 0,
      name: '',
      status: '',
      mobile: '',
      identity: 0,
      email: 'email',
      username: '',
      password: '',
      confirmPassword: '',
      title: '',
      Nationailty: '',
      Gender: null,
      BirthDate: '',
      Description: '',
      AccountStatus: '');
  Map<String, dynamic> Customersdata = {};
  Future<void> GetCustomersbyid({required int id}) async {
    emit(GetCustomersByIdLoading());
    await DioHelper.getData(url: "Customers/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetCustomersbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Customersdata = value.data['data'];
      Utility.myPrintX(Customersdata);
      if (value.data['statusCode'] != 200) {
        emit(GetCustomersByIdFail());
      } else {
        CustomersbyIdModel = CustomersModel.fromJson(Customersdata);

        emit(GetCustomersByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetCustomersbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetCustomersByIdFail());
      throw onError;
    });
  }

  SelectRadioButtonforGender(value) {
    selectedOptionforGendervalue = value;
    emit(selectedOptionforGenderState());
  }

  SelectRadioButtonforAccount(value) {
    selectedOptionForAccountvalue = value;
    emit(selectedOptionForAccountState());
  }

  Future<void> EditCustomers(CustomersModel customersModel) async {
    name.text = customersModel.name ?? '';
    username.text = customersModel.username ?? '';
    password.text = customersModel.password ?? '';
    confirmPassword.text = customersModel.confirmPassword ?? '';
    Mobile.text = customersModel.mobile ?? '';
    email.text = customersModel.email ?? '';
    title.text = customersModel.title ?? '';

    emit(EditCustomersstate());
  }

  Future<void> RemoveData() async {
    name.clear();
    username.clear();
    password.clear();
    confirmPassword.clear();
    confirmPassword.clear();
    Mobile.clear();
    email.clear();
    title.clear();

    emit(RemoveDataState());
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
}
