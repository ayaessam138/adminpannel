import 'package:afcooadminpanel/Banners/bannersModel.dart';
import 'package:afcooadminpanel/Banners/banners_cubit.dart';
import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBanners extends StatelessWidget {
  AddBanners({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<BannersCubit, BannersState>(
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
                      Text(isAdd ? 'Adding Banners' : "Editing Banners",
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
                                              BlocProvider.of<BannersCubit>(
                                                      context)
                                                  .title,
                                          onSaved: (String? value) {
                                            BlocProvider.of<BannersCubit>(
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
                                              BlocProvider.of<BannersCubit>(
                                                      context)
                                                  .titleEn,
                                          onSaved: (String? value) {
                                            BlocProvider.of<BannersCubit>(
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
                                buildRowWithWidght(
                                    labelText: 'Image',
                                    width: 200,
                                    widget: UpladImageButton(
                                      onPressed: () {
                                        BlocProvider.of<BannersCubit>(context)
                                            .PickImage();
                                      },
                                    )),
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
                                          labelText: 'Url',
                                          controller:
                                              BlocProvider.of<BannersCubit>(
                                                      context)
                                                  .url,
                                          onSaved: (String? value) {
                                            BlocProvider.of<BannersCubit>(
                                                    context)
                                                .url
                                                .text = value!;
                                          },
                                          size: 700),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Expanded(
                                      child: buildRowWithWidght(
                                          labelText: 'Duration Show',
                                          width: 300,
                                          widget:
                                              TextformFieldWidghtwithCounter(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Field is required';
                                              }
                                            },
                                            controller:
                                                BlocProvider.of<BannersCubit>(
                                                        context)
                                                    .Durationofshow,
                                            onChanged: (value) {
                                              BlocProvider.of<BannersCubit>(
                                                      context)
                                                  .SaveDurationofshowCount(
                                                      value);
                                            },
                                            onPressedIncrement: () {
                                              BlocProvider.of<BannersCubit>(
                                                      context)
                                                  .IncrementDurationofshowCounter();
                                            },
                                            onPressedDecrement: () {
                                              BlocProvider.of<BannersCubit>(
                                                      context)
                                                  .DecrementDurationofshowCounter();
                                            },
                                          )),
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 100,
                                            widget: RadioListTilewidghtinColumn(
                                              selectedOption:
                                                  BlocProvider.of<BannersCubit>(
                                                          context)
                                                      .selectedOptionforcase,
                                              onChanged: (val) {
                                                BlocProvider.of<BannersCubit>(
                                                        context)
                                                    .SelectRadioButtonForcase(
                                                        val);
                                              },
                                            ))),
                                    Expanded(
                                      child: buildRowWithTextField(

                                          // onPanUpdate: (DragUpdateDetails deatils) {
                                          //   BlocProvider.of<BannersCubit>(context)
                                          //       .changesize(deatils: deatils);
                                          // },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Field is required';
                                            }
                                            return '';
                                          },
                                          labelText: 'Item Order',
                                          controller:
                                              BlocProvider.of<BannersCubit>(
                                                      context)
                                                  .ItemOrder,
                                          onSaved: (String? value) {
                                            BlocProvider.of<BannersCubit>(
                                                    context)
                                                .ItemOrder
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
                                            labelText: 'Show in Website',
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            widget: RadioListTilewidghtinRowYes(
                                              selectedOption: BlocProvider.of<
                                                      BannersCubit>(context)
                                                  .selectedOptionforShowinWebsite,
                                              onChanged: (val) {
                                                BlocProvider.of<BannersCubit>(
                                                        context)
                                                    .SelectRadioButtonForShowinWebsite(
                                                        val);
                                              },
                                            ))),
                                    Expanded(
                                        child: buildRowWithWidght(
                                            labelText: 'Show in App',
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            widget: RadioListTilewidghtinRowYes(
                                              selectedOption: BlocProvider.of<
                                                      BannersCubit>(context)
                                                  .selectedOptionforShowinApp,
                                              onChanged: (val) {
                                                BlocProvider.of<BannersCubit>(
                                                        context)
                                                    .SelectRadioButtonForShowinapp(
                                                        val);
                                              },
                                            ))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color(0xffECF0F5),
                            thickness: 2,
                          ),
                          CustomButton(
                            onTap: () {
                              // AddBannersimage addBannersimage = AddBannersimage(
                              //   image: BlocProvider.of<BannersCubit>(context)
                              //       .selectedLogo,
                              // );

                              BannersModel addBannersModel = BannersModel(
                                id: 0,
                                title: BlocProvider.of<BannersCubit>(context)
                                    .title
                                    .text,
                                titleEn: BlocProvider.of<BannersCubit>(context)
                                    .titleEn
                                    .text,
                                status: BlocProvider.of<BannersCubit>(context)
                                            .selectedOptionforcase ==
                                        'Posted'
                                    ? 1
                                    : 0,
                                url: '',
                                image: '',
                                ShowinWebSite: BlocProvider.of<BannersCubit>(
                                                context)
                                            .selectedOptionforShowinWebsite ==
                                        'Yes'
                                    ? 1
                                    : 0,
                                ShowinApp:
                                    BlocProvider.of<BannersCubit>(context)
                                                .selectedOptionforShowinApp ==
                                            'Yes'
                                        ? 1
                                        : 0,
                                Durantion: int.parse(
                                    BlocProvider.of<BannersCubit>(context)
                                        .Durationofshow
                                        .text),
                                ItemOrder: int.parse(
                                    BlocProvider.of<BannersCubit>(context)
                                        .ItemOrder
                                        .text),
                              );
                              // BlocProvider.of<BannersCubit>(context).AddBanners(
                              //     BannersModel: addBannersModel,
                              //     addBannersimage: addBannersimage);
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
