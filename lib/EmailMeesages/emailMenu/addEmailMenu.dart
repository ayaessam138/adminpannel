import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';
import 'package:afcooadminpanel/Core/widghts/filterDropdownList.dart';
import 'package:afcooadminpanel/EmailMeesages/emailMenu/emailMenuModel.dart';
import 'package:afcooadminpanel/EmailMeesages/emailMenu/email_menu_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmailMenu extends StatelessWidget {
  AddEmailMenu({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<EmailMenuCubit, EmailMenuState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(isAdd ? 'Adding EmailMenu' : "Editing EmailMenu",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24))
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(
                                width: 3, color: Color(0xff3C8DBC)))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration:
                              const BoxDecoration(color: Color(0xffFBF9F4)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: buildRowWithTextField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Field is required';
                                                }
                                                return '';
                                              },
                                              labelText: 'Name',
                                              controller:
                                                  BlocProvider.of<EmailMenuCubit>(
                                                          context)
                                                      .name,
                                              onSaved: (String? value) {
                                                BlocProvider.of<EmailMenuCubit>(
                                                        context)
                                                    .name
                                                    .text = value!;
                                              },
                                              size: 300),
                                        ),
                                        Expanded(
                                          child: buildRowWithTextField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Field is required';
                                                }
                                                return '';
                                              },
                                              labelText: 'Email',
                                              controller:
                                                  BlocProvider.of<EmailMenuCubit>(
                                                          context)
                                                      .Email,
                                              onSaved: (String? value) {
                                                BlocProvider.of<EmailMenuCubit>(
                                                        context)
                                                    .Email
                                                    .text = value!;
                                              },
                                              size: 300),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: buildRowWithTextField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Field is required';
                                                }
                                                return '';
                                              },
                                              labelText: 'Mobile',
                                              controller:
                                                  BlocProvider.of<EmailMenuCubit>(
                                                          context)
                                                      .Mobile,
                                              onSaved: (String? value) {
                                                BlocProvider.of<EmailMenuCubit>(
                                                        context)
                                                    .Mobile
                                                    .text = value!;
                                              },
                                              size: 300),
                                        ),
                                        Expanded(
                                          child: buildRowWithTextField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Field is required';
                                                }
                                                return '';
                                              },
                                              labelText: 'Company Nmae',
                                              controller:
                                                  BlocProvider.of<EmailMenuCubit>(
                                                          context)
                                                      .CompanyNmae,
                                              onSaved: (String? value) {
                                                BlocProvider.of<EmailMenuCubit>(
                                                        context)
                                                    .CompanyNmae
                                                    .text = value!;
                                              },
                                              size: 300),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    buildRowWithTextField(
                                      Maxlines: 2,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Field is required';
                                          }
                                          return '';
                                        },
                                        labelText: 'Message',
                                        controller:
                                            BlocProvider.of<EmailMenuCubit>(context)
                                                .Message,
                                        onSaved: (String? value) {
                                          BlocProvider.of<EmailMenuCubit>(context)
                                              .Message
                                              .text = value!;
                                        },
                                        size: 700),
                                    SizedBox(height: 12,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: buildRowWithWidght(
                                              labelText:
                                              'EmailGroup',
                                              width: 300,
                                              widget: DropdownList(
                                                  Options: [
                                                    'Option 1',
                                                    'Option 2',
                                                    'Option 3'
                                                  ]
                                                      .map((String
                                                  value) =>
                                                      DropdownMenuItem<
                                                          String>(
                                                        value:
                                                        value,
                                                        child: Text(
                                                            value),
                                                      ))
                                                      .toList(),
                                                  Hint: '',
                                                  onChanged:
                                                      (value) {})),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Color(0xffECF0F5),
                            thickness: 2,
                          ),
                          CustomButton(
                            onTap: () {
                              EmailMenuModel addEmailMenuModel = EmailMenuModel(
                                  id: 0,
                                  name: BlocProvider.of<EmailMenuCubit>(context)
                                      .name
                                      .text,
                                  email:
                                      BlocProvider.of<EmailMenuCubit>(context)
                                          .Email
                                          .text,
                                  mobile:
                                      BlocProvider.of<EmailMenuCubit>(context)
                                          .Mobile
                                          .text,
                                  companyName:
                                      BlocProvider.of<EmailMenuCubit>(context)
                                          .CompanyNmae
                                          .text,
                                  Message:
                                      BlocProvider.of<EmailMenuCubit>(context)
                                          .Message
                                          .text,
                                  emailGroup: '');
                              BlocProvider.of<EmailMenuCubit>(context).AddEmailMenu(
                              emailMenuModel: addEmailMenuModel);
                            },
                            title: isAdd ? 'Add' : "Edit",
                            height: 40,
                            width: 120,
                            textcolor: Colors.white,
                            backGroundcolor: const Color(0xff095A56),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
