import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';

import 'package:afcooadminpanel/WebsiteMangement/cardfield/card_field_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/cardfield/cardfieldModel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardField extends StatelessWidget {
  AddCardField({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<CardFieldCubit, CardFieldState>(
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
                      Text(isAdd ? 'Adding CardField' : "Editing CardField",
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
                            top: BorderSide(width: 3, color: Color(0xff3C8DBC)))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
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
                                          labelText: 'Title',
                                          controller:
                                              BlocProvider.of<CardFieldCubit>(
                                                      context)
                                                  .title,
                                          onSaved: (String? value) {
                                            BlocProvider.of<CardFieldCubit>(
                                                    context)
                                                .title
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
                                          labelText: 'Title In English',
                                          controller:
                                              BlocProvider.of<CardFieldCubit>(
                                                      context)
                                                  .titleEn,
                                          onSaved: (String? value) {
                                            BlocProvider.of<CardFieldCubit>(
                                                    context)
                                                .titleEn
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
                                    labelText: 'content',
                                    controller:
                                        BlocProvider.of<CardFieldCubit>(context)
                                            .content,
                                    onSaved: (String? value) {
                                      BlocProvider.of<CardFieldCubit>(context)
                                          .content
                                          .text = value!;
                                    },
                                    size: 700),
                                const SizedBox(
                                  height: 12,
                                ),
                                buildRowWithTextField(
                                  Maxlines: 2,
                                    // onPanUpdate: (DragUpdateDetails deatils) {
                                    //   BlocProvider.of<CardFieldCubit>(context)
                                    //       .changesize(deatils: deatils);
                                    // },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Field is required';
                                      }
                                      return '';
                                    },
                                    labelText: 'content in English',
                                    controller:
                                        BlocProvider.of<CardFieldCubit>(context)
                                            .contentEn,
                                    onSaved: (String? value) {
                                      BlocProvider.of<CardFieldCubit>(context)
                                          .contentEn
                                          .text = value!;
                                    },
                                    size: 700),
                                const SizedBox(
                                  height: 12,
                                ),
                                buildRowWithWidght(
                                    labelText: 'Image',
                                    width: 200,
                                    widget: UpladImageButton(
                                      onPressed: () {
                                        BlocProvider.of<CardFieldCubit>(context)
                                            .PickImage();
                                      },
                                    )),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: buildRowWithWidght(
                                            labelText: 'Case',
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: 100,
                                            widget: RadioListTilewidghtinColumn(
                                              selectedOption:
                                                  BlocProvider.of<CardFieldCubit>(
                                                          context)
                                                      .selectedOption,
                                              onChanged: (val) {
                                                BlocProvider.of<CardFieldCubit>(
                                                        context)
                                                    .SelectRadioButton(val);
                                              },
                                            ))),
                                    Expanded(
                                      child: buildRowWithWidght(
                                          labelText: 'Item Order',
                                          width: 300,
                                          widget: TextformFieldWidghtwithCounter(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Field is required';
                                              }
                                            },
                                            controller:
                                                BlocProvider.of<CardFieldCubit>(
                                                        context)
                                                    .ItemOrder,
                                            onChanged: (value) {
                                              BlocProvider.of<CardFieldCubit>(
                                                      context)
                                                  .SaveItemOrderCount(value);
                                            },
                                            onPressedIncrement: () {
                                              BlocProvider.of<CardFieldCubit>(
                                                      context)
                                                  .IncrementItemOrderCounter();
                                            },
                                            onPressedDecrement: () {
                                              BlocProvider.of<CardFieldCubit>(
                                                      context)
                                                  .DecrementItemOrderCounter();
                                            },
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color(0xffECF0F5),
                            thickness: 2,
                          ),
                          CustomButton(
                            onTap: () {
                              // AddcardFieldimage addcardFieldimage = AddcardFieldimage(
                              //   image: BlocProvider.of<CardFieldCubit>(context)
                              //       .selectedLogo,
                              // );

                              CardFieldModel addcardFieldModel = CardFieldModel(
                                id: 0,
                                title: BlocProvider.of<CardFieldCubit>(context)
                                    .title
                                    .text,
                                titleEn: BlocProvider.of<CardFieldCubit>(context)
                                    .titleEn
                                    .text,
                                status: BlocProvider.of<CardFieldCubit>(context)
                                    .selectedOption ==
                                    'Posted'
                                    ? 1
                                    : 0, image: '', icon: '', sortAt: 0, content: '', contentEn: '',

                              );
                              // BlocProvider.of<CardFieldCubit>(context).AddcardField(
                              //     cardFieldModel: addcardFieldModel,
                              //     addcardFieldimage: addcardFieldimage);
              
              
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
