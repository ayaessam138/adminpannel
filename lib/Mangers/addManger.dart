import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';
import 'package:afcooadminpanel/Mangers/mangers_cubit.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMangers extends StatelessWidget {
  AddMangers({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<MangersCubit, MangersState>(
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
                      Text(isAdd ? 'Adding Mangers' : "Editing Mangers",
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
                          Container(
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
                                            labelText: 'name',
                                            controller:
                                                BlocProvider.of<MangersCubit>(
                                                        context)
                                                    .name,
                                            onSaved: (String? value) {
                                              BlocProvider.of<MangersCubit>(
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
                                            labelText: 'User Nmae',
                                            controller:
                                                BlocProvider.of<MangersCubit>(
                                                        context)
                                                    .username,
                                            onSaved: (String? value) {
                                              BlocProvider.of<MangersCubit>(
                                                      context)
                                                  .username
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
                                            labelText: 'Password',
                                            controller:
                                                BlocProvider.of<MangersCubit>(
                                                        context)
                                                    .password,
                                            onSaved: (String? value) {
                                              BlocProvider.of<MangersCubit>(
                                                      context)
                                                  .password
                                                  .text = value!;
                                            },
                                            size: 1000),
                                      ),
                                      Expanded(
                                        child: buildRowWithTextField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Field is required';
                                              }
                                              return '';
                                            },
                                            labelText: 'ConfirmPassword',
                                            controller:
                                                BlocProvider.of<MangersCubit>(
                                                        context)
                                                    .confirmPassword,
                                            onSaved: (String? value) {
                                              BlocProvider.of<MangersCubit>(
                                                      context)
                                                  .confirmPassword
                                                  .text = value!;
                                            },
                                            size: 600),
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
                                                BlocProvider.of<MangersCubit>(
                                                        context)
                                                    .Mobile,
                                            onSaved: (String? value) {
                                              BlocProvider.of<MangersCubit>(
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
                                            labelText: 'Email',
                                            controller:
                                                BlocProvider.of<MangersCubit>(
                                                        context)
                                                    .email,
                                            onSaved: (String? value) {
                                              BlocProvider.of<MangersCubit>(
                                                      context)
                                                  .email
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
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Field is required';
                                        }
                                        return '';
                                      },
                                      labelText: 'Title',
                                      controller:
                                          BlocProvider.of<MangersCubit>(context)
                                              .title,
                                      onSaved: (String? value) {
                                        BlocProvider.of<MangersCubit>(context)
                                            .title
                                            .text = value!;
                                      },
                                      size: 225),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  buildRowWithWidght(
                                      labelText: 'Image',
                                      width: 200,
                                      widget: UpladImageButton(
                                        onPressed: () {
                                          BlocProvider.of<MangersCubit>(context)
                                              .PickImage();
                                        },
                                      )),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  buildRowWithWidght(
                                      labelText: 'Account Status',
                                      width: MediaQuery.of(context).size.width,
                                      // height: 100,
                                      widget: RadioListTilewidghtinRowGenral(
                                        selectedOption:
                                            BlocProvider.of<MangersCubit>(
                                                    context)
                                                .selectedOptionForAccountvalue,
                                        onChanged: (val) {
                                          BlocProvider.of<MangersCubit>(context)
                                              .SelectRadioButtonforAccount(val);
                                        },
                                        title1: 'Activated',
                                        value1: 'Activated',
                                        title2: 'NotActivated',
                                        value2: 'NotActivated',
                                      )),
                                  buildRowWithWidght(
                                      labelText: 'Language',
                                      width: MediaQuery.of(context).size.width,
                                      // height: 80,
                                      widget: RadioListTilewidghtinRowGenral(
                                        selectedOption:
                                            BlocProvider.of<MangersCubit>(
                                                    context)
                                                .selectedOptionforLanguagevalue,
                                        onChanged: (val) {
                                          BlocProvider.of<MangersCubit>(context)
                                              .SelectRadioButtonforLanguage(val);
                                        },
                                        title1: 'Arabic',
                                        value1: 'Arabic',
                                        title2: 'English',
                                        value2: 'English',
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            color: Color(0xffECF0F5),
                            thickness: 2,
                          ),
                          CustomButton(
                            onTap: () {
                              // AddMangersimage addMangersimage =
                              // AddMangersimage(
                              //     image: BlocProvider.of<MangersCubit>(
                              //         context)
                              //         .selectedImageUnit8List);
                              // MangersModel MangersModel = MangersModel(
                              //   id: 0,
                              //   name: BlocProvider.of<MangersCubit>(context)
                              //       .name
                              //       .text,
                              //   username: BlocProvider.of<MangersCubit>(context)
                              //       .username
                              //       .text,
                              //   status: BlocProvider.of<MangersCubit>(context)
                              //       .selectedOption ==
                              //       'Posted'
                              //       ? 1
                              //       : 0,
                              //   Content: BlocProvider.of<MangersCubit>(context)
                              //       .password
                              //       .text,
                              //   ContentEn:
                              //   BlocProvider.of<MangersCubit>(context)
                              //       .confirmPassword
                              //       .text,
                              //   Mobile: int.parse(
                              //       BlocProvider.of<MangersCubit>(context)
                              //           .Mobile
                              //           .text),
                              // );
                              // BlocProvider.of<MangersCubit>(context)
                              //     .AddMangers(MangersModel, addMangersimage);
                            },
                            title: isAdd ? 'Add' : 'Edit',
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
