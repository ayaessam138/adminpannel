import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';

import 'package:afcooadminpanel/Sliders/sliders_cubit.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSliders extends StatelessWidget {
  AddSliders({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<SlidersCubit, SlidersState>(
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
                      Text(isAdd?'Adding Sliders':"Editing Sliders",
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
                                            labelText: 'Title',
                                            controller:
                                            BlocProvider.of<SlidersCubit>(
                                                context)
                                                .title,
                                            onSaved: (String? value) {
                                              BlocProvider.of<SlidersCubit>(
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
                                            BlocProvider.of<SlidersCubit>(
                                                context)
                                                .titleEn,
                                            onSaved: (String? value) {
                                              BlocProvider.of<SlidersCubit>(
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
                                      labelText: 'Content',
                                      controller:
                                      BlocProvider.of<SlidersCubit>(context)
                                          .content,
                                      onSaved: (String? value) {
                                        BlocProvider.of<SlidersCubit>(context)
                                            .content
                                            .text = value!;
                                      },
                                      size: 600),
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
                                      labelText: 'Content in English',
                                      controller:
                                      BlocProvider.of<SlidersCubit>(context)
                                          .contentEn,
                                      onSaved: (String? value) {
                                        BlocProvider.of<SlidersCubit>(context)
                                            .contentEn
                                            .text = value!;
                                      },
                                      size: 600),
                                  const SizedBox(
                                    height: 12,
                                  ),


                                  buildRowWithWidght(
                                      labelText: 'Image',
                                      width: 200,
                                      widget: UpladImageButton(
                                        onPressed: () {
                                          BlocProvider.of<SlidersCubit>(context)
                                              .PickImage();
                                        },
                                      )),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: buildRowWithWidght(
                                              labelText: 'Case',
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 100,
                                              widget: RadioListTilewidghtinColumn(
                                                selectedOption:
                                                BlocProvider.of<SlidersCubit>(
                                                    context)
                                                    .selectedOption,
                                                onChanged: (val) {
                                                  BlocProvider.of<SlidersCubit>(
                                                      context)
                                                      .SelectRadioButton(val);
                                                },
                                              ))),

                                      Expanded(
                                        child: buildRowWithTextField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Field is required';
                                              }
                                              return '';
                                            },
                                            labelText: 'Item Order',
                                            controller:
                                            BlocProvider.of<SlidersCubit>(
                                                context)
                                                .SortAt,
                                            onSaved: (String? value) {
                                              BlocProvider.of<SlidersCubit>(
                                                  context)
                                                  .SortAt
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
                                      labelText: 'link',
                                      controller:
                                      BlocProvider.of<SlidersCubit>(context)
                                          .Url,
                                      onSaved: (String? value) {
                                        BlocProvider.of<SlidersCubit>(context)
                                            .Url
                                            .text = value!;
                                      },
                                      size: 300),
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
                              // AddOfferimage addOfferimage = AddOfferimage(
                              //   image: BlocProvider.of<SlidersCubit>(context)
                              //       .selectedImageUnit8List,
                              // );
                              // print('addOfferimage');
                              // print(addOfferimage.image);
                              // SlidersModel addOfferModel = SlidersModel(
                              //   id: 0,
                              //   name: BlocProvider.of<SlidersCubit>(context)
                              //       .name
                              //       .text,
                              //   nameEn: BlocProvider.of<SlidersCubit>(context)
                              //       .nameEn
                              //       .text,
                              //   status: BlocProvider.of<SlidersCubit>(context)
                              //       .selectedOption ==
                              //       'Posted'
                              //       ? 1
                              //       : 0,
                              //   partnerId: BlocProvider.of<PartnerCubit>(context)
                              //       .PartnerModelObj!
                              //       .id,
                              //   description: BlocProvider.of<SlidersCubit>(context)
                              //       .desCription
                              //       .text,
                              //   descriptionEn:
                              //   BlocProvider.of<SlidersCubit>(context)
                              //       .descriptonEn
                              //       .text,
                              //
                              // );
                              // BlocProvider.of<SlidersCubit>(context).Addofffer(
                              //     addOfferModel: addOfferModel,
                              //     addOfferimage: addOfferimage);
                            },
                            title: isAdd?'Add':'Edit',
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
