import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';
import 'package:afcooadminpanel/WebsiteMangement/Nationality/nationalityModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/Nationality/nationnality_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNationality extends StatelessWidget {
  AddNationality({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<NationnalityCubit, NationnalityState>(
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
                      Text(isAdd ? 'Adding Nationality' : "Editing Nationality",
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
                                          labelText: 'Name',
                                          controller:
                                          BlocProvider.of<NationnalityCubit>(
                                              context)
                                              .name,
                                          onSaved: (String? value) {
                                            BlocProvider.of<NationnalityCubit>(
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
                                          labelText: 'Name in  English',
                                          controller:
                                          BlocProvider.of<NationnalityCubit>(
                                              context)
                                              .nameEn,
                                          onSaved: (String? value) {
                                            BlocProvider.of<NationnalityCubit>(
                                                context)
                                                .nameEn
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
                                        child: buildRowWithWidght(
                                            labelText: 'Case',
                                            width:
                                            MediaQuery.of(context).size.width,
                                            height: 100,
                                            widget: RadioListTilewidghtinColumn(
                                              selectedOption:
                                              BlocProvider.of<NationnalityCubit>(
                                                  context)
                                                  .selectedOption,
                                              onChanged: (val) {
                                                BlocProvider.of<NationnalityCubit>(
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
                                            BlocProvider.of<NationnalityCubit>(
                                                context)
                                                .ItemOrder,
                                            onChanged: (value) {
                                              BlocProvider.of<NationnalityCubit>(
                                                  context)
                                                  .SaveItemOrderCount(value);
                                            },
                                            onPressedIncrement: () {
                                              BlocProvider.of<NationnalityCubit>(
                                                  context)
                                                  .IncrementItemOrderCounter();
                                            },
                                            onPressedDecrement: () {
                                              BlocProvider.of<NationnalityCubit>(
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


                              NationalityModel addNationalityModel = NationalityModel(
                                id: 0,
                                name: BlocProvider.of<NationnalityCubit>(context)
                                    .name
                                    .text,
                                nameEn: BlocProvider.of<NationnalityCubit>(context)
                                    .nameEn
                                    .text,
                                status: BlocProvider.of<NationnalityCubit>(context)
                                    .selectedOption ==
                                    'Posted'
                                    ? 1
                                    : 0, sortAt: int.parse(BlocProvider.of<NationnalityCubit>(context).ItemOrder.text),

                              );
                              // BlocProvider.of<NationnalityCubit>(context).AddNationality(
                              //     NationalityModel: addNationalityModel,
                              //     addNationalityimage: addNationalityimage);


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
