import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';

import 'package:afcooadminpanel/WebsiteMangement/websiteContentMangement/websiteContentMangementModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/websiteContentMangement/website_content_mangement_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWebsiteContentMangement extends StatelessWidget {
  AddWebsiteContentMangement({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<WebsiteContentMangementCubit,
          WebsiteContentMangementState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text("Editing WebsiteContentMangement",
                          style: TextStyle(
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
                                            labelText: 'Title',
                                            controller: BlocProvider.of<
                                                        WebsiteContentMangementCubit>(
                                                    context)
                                                .title,
                                            onSaved: (String? value) {
                                              BlocProvider.of<
                                                          WebsiteContentMangementCubit>(
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
                                            controller: BlocProvider.of<
                                                        WebsiteContentMangementCubit>(
                                                    context)
                                                .titleEn,
                                            onSaved: (String? value) {
                                              BlocProvider.of<
                                                          WebsiteContentMangementCubit>(
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
                                      controller: BlocProvider.of<
                                                  WebsiteContentMangementCubit>(
                                              context)
                                          .content,
                                      onSaved: (String? value) {
                                        BlocProvider.of<
                                                    WebsiteContentMangementCubit>(
                                                context)
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
                                      labelText: 'content in English',
                                      controller: BlocProvider.of<
                                                  WebsiteContentMangementCubit>(
                                              context)
                                          .contentEn,
                                      onSaved: (String? value) {
                                        BlocProvider.of<
                                                    WebsiteContentMangementCubit>(
                                                context)
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
                                          BlocProvider.of<
                                                      WebsiteContentMangementCubit>(
                                                  context)
                                              .PickImage();
                                        },
                                      )),
                                  const SizedBox(
                                    height: 12,
                                  ),
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
                              AddWebsiteContentMangementimage
                                  addWebsiteContentMangementimage =
                                  AddWebsiteContentMangementimage(
                                image: BlocProvider.of<
                                        WebsiteContentMangementCubit>(context)
                                    .selectedImageUnit8List,
                              );

                              AddWebsiteContentMangementModel
                                  websiteContentMangementModel =
                                  AddWebsiteContentMangementModel(
                                id: 0,
                                title: BlocProvider.of<
                                        WebsiteContentMangementCubit>(context)
                                    .title
                                    .text,
                                titleEn: BlocProvider.of<
                                        WebsiteContentMangementCubit>(context)
                                    .titleEn
                                    .text,
                                content: BlocProvider.of<
                                        WebsiteContentMangementCubit>(context)
                                    .content
                                    .text,
                                contentEn: BlocProvider.of<
                                        WebsiteContentMangementCubit>(context)
                                    .contentEn
                                    .text,
                              );
                              BlocProvider.of<WebsiteContentMangementCubit>(
                                      context)
                                  .AddWebsiteContentMangement(
                                      websiteContentMangementModel:
                                          websiteContentMangementModel,
                                      addWebsiteContentMangementimage:
                                          addWebsiteContentMangementimage);
                            },
                            title: "Edit",
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
