// import 'dart:async';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// String? validateEmail(String? email) {
//   if (email == null || email.isEmpty) {
//     return 'Emailcannotbeempty'.tr();
//   } else if (!RegExp(  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//       .hasMatch(email)) {
//     return 'Enteravalidemailaddress'.tr();
//   }
//   return null; // No validation error
// }
//
// String? validateSaudiPhoneNumber(String? phoneNumber) {
//   if (phoneNumber == null || phoneNumber.isEmpty) {
//     return 'Phonenumbercannotbeempty'.tr();
//   }
//
//   String cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
//
//   if (!cleanedPhoneNumber.startsWith('966')) {
//     return 'EnterSaudinumberstartingwith966'.tr();
//   }
//
//   if (cleanedPhoneNumber.length != 12) {
//     return 'Entervalid12-digitSaudinumber'.tr();
//   }
//
//   return null;
// }
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget buildRowWithTextField(
    {required String labelText,
    required TextEditingController controller,
    required void Function(String?)? onSaved,
    // void Function(DragUpdateDetails)? onPanUpdate,
    String Function(String?)? validator,
    required double size,
    int? Maxlines}) {
  return Row(
    children: [
      Flexible(
        child: SizedBox(
          width: 150,
          child: Text(
            labelText,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Color(0xff8B8B94)),
          ),
        ),
      ),
      const SizedBox(
        width: 70,
      ),
      Flexible(
          child: SizedBox(
              width: size,
              child: TextformFieldWidght(
                  validator: validator,
                  maxLines: Maxlines,
                  controller: controller,
                  onSaved: onSaved))),
    ],
  );
}

Widget buildRowWithWidght(
    {required String labelText,
    required double width,
    double? height,
    int? flex,
    required Widget widget}) {
  return Row(
    children: [
      Flexible(
        child: SizedBox(
          width: 150,
          child: Text(
            labelText,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Color(0xff8B8B94)),
          ),
        ),
      ),
      const SizedBox(
        width: 70,
      ),
      Flexible(
          flex: flex ?? 1,
          child: SizedBox(width: width, height: height, child: widget)),
    ],
  );
}

Widget buildColumnWithTextField(
    {required String labelText,
    required TextEditingController controller,
    required void Function(String?)? onSaved,
    required double size,
    int? Maxlines}) {
  return SizedBox(
    height: 100,
    child: Column(
      children: [
        Flexible(
          child: Row(
            children: [
              Text(
                labelText,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Color(0xff8B8B94)),
              ),
            ],
          ),
        ),
        Flexible(
            child: SizedBox(
          width: size,
          child: TextformFieldWidght(
              maxLines: Maxlines, controller: controller, onSaved: onSaved),
        )),
      ],
    ),
  );
}
InputDecoration buildInputDecoration() {
  return const InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 16.0),
      isDense: true,
      filled: true,
      hintStyle: TextStyle(fontFamily: 'SST Arabic'),
      fillColor: Colors.white,


      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff3C8DBC))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffB7B7B7))),
      border:
      OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFBF9F4))
        //
      ));
}