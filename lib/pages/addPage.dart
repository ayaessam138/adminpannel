import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';
import 'package:afcooadminpanel/pages/PagesModel.dart';
import 'package:afcooadminpanel/pages/pages_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPages extends StatelessWidget {
  AddPages({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<PagesCubit, PagesState>(
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
                      Text(isAdd ? 'Adding Pages' : "Editing Pages",
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
                                            labelText: 'Slug',
                                            controller:
                                            BlocProvider.of<PagesCubit>(
                                                context)
                                                .slug,
                                            onSaved: (String? value) {
                                              BlocProvider.of<PagesCubit>(
                                                  context)
                                                  .slug
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
                                            labelText: 'Title',
                                            controller:
                                            BlocProvider.of<PagesCubit>(
                                                context)
                                                .title,
                                            onSaved: (String? value) {
                                              BlocProvider.of<PagesCubit>(
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
                                            BlocProvider.of<PagesCubit>(
                                                context)
                                                .titleEn,
                                            onSaved: (String? value) {
                                              BlocProvider.of<PagesCubit>(
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: buildRowWithTextField(
                                            Maxlines: 2,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Field is required';
                                              }
                                              return '';
                                            },
                                            labelText: 'Content',
                                            controller:
                                            BlocProvider.of<PagesCubit>(
                                                context)
                                                .content,
                                            onSaved: (String? value) {
                                              BlocProvider.of<PagesCubit>(context)
                                                  .content
                                                  .text = value!;
                                            },
                                            size: 1000),
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
                                      labelText: 'Content in English',
                                      controller:
                                      BlocProvider.of<PagesCubit>(
                                          context)
                                          .contentEn,
                                      onSaved: (String? value) {
                                        BlocProvider.of<PagesCubit>(context)
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
                                          BlocProvider.of<PagesCubit>(
                                              context)
                                              .PickImage();
                                        },
                                      )),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  buildRowWithWidght(
                                      labelText: 'Case',
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      widget: RadioListTilewidghtinRowPosted(
                                        selectedOption:
                                        BlocProvider.of<PagesCubit>(
                                            context)
                                            .selectedOption,
                                        onChanged: (val) {
                                          BlocProvider.of<PagesCubit>(
                                              context)
                                              .SelectRadioButton(val);
                                        },
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
                              AddPagesimage addPagesimage =
                              AddPagesimage(
                                  image: BlocProvider.of<PagesCubit>(
                                      context)
                                      .selectedImageUnit8List);
                              PagesModel pagesModel = PagesModel(
                                id: 0,
                                title: BlocProvider.of<PagesCubit>(context)
                                    .title
                                    .text,
                                titleEn: BlocProvider.of<PagesCubit>(context)
                                    .titleEn
                                    .text,
                                status: BlocProvider.of<PagesCubit>(context)
                                    .selectedOption ==
                                    'Posted'
                                    ? 1
                                    : 0,
                                content: BlocProvider.of<PagesCubit>(context)
                                    .content
                                    .text,
                                contentEn:
                                BlocProvider.of<PagesCubit>(context)
                                    .contentEn
                                    .text,
                                slug:
                                    BlocProvider.of<PagesCubit>(context)
                                        .slug
                                        .text,
                              );
                              BlocProvider.of<PagesCubit>(context)
                                  .AddPages(pagesModel, addPagesimage);
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
