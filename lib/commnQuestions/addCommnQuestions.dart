import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';
import 'package:afcooadminpanel/commnQuestions/commnQuestionsModel.dart';
import 'package:afcooadminpanel/commnQuestions/commn_questions_cubit.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCommnQuestions extends StatelessWidget {
  AddCommnQuestions({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<CommnQuestionsCubit, CommnQuestionsState>(
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
                      Text(
                          isAdd
                              ? 'Adding CommnQuestions'
                              : "Editing CommnQuestions",
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
                                            labelText: 'Title',
                                            controller: BlocProvider.of<
                                                        CommnQuestionsCubit>(
                                                    context)
                                                .title,
                                            onSaved: (String? value) {
                                              BlocProvider.of<
                                                          CommnQuestionsCubit>(
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
                                                        CommnQuestionsCubit>(
                                                    context)
                                                .titleEn,
                                            onSaved: (String? value) {
                                              BlocProvider.of<
                                                          CommnQuestionsCubit>(
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
                                          BlocProvider.of<CommnQuestionsCubit>(
                                                  context)
                                              .content,
                                      onSaved: (String? value) {
                                        BlocProvider.of<CommnQuestionsCubit>(
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
                                      labelText: 'Content in English',
                                      controller:
                                          BlocProvider.of<CommnQuestionsCubit>(
                                                  context)
                                              .contentEn,
                                      onSaved: (String? value) {
                                        BlocProvider.of<CommnQuestionsCubit>(
                                                context)
                                            .contentEn
                                            .text = value!;
                                      },
                                      size: 600),
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
                                            labelText: 'Item Order',
                                            controller: BlocProvider.of<
                                                        CommnQuestionsCubit>(
                                                    context)
                                                .SortAt,
                                            onSaved: (String? value) {
                                              BlocProvider.of<
                                                          CommnQuestionsCubit>(
                                                      context)
                                                  .SortAt
                                                  .text = value!;
                                            },
                                            size: 300),
                                      ),
                                      Expanded(
                                          child: buildRowWithWidght(
                                              labelText: 'Case',
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 100,
                                              widget:
                                                  RadioListTilewidghtinColumn(
                                                selectedOption: BlocProvider.of<
                                                            CommnQuestionsCubit>(
                                                        context)
                                                    .selectedOption,
                                                onChanged: (val) {
                                                  BlocProvider.of<
                                                              CommnQuestionsCubit>(
                                                          context)
                                                      .SelectRadioButton(val);
                                                },
                                              ))),
                                    ],
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
                              CommnQuestionsModel commnQuestionsModel = CommnQuestionsModel(
                                  id: 0,
                                  title:
                                      BlocProvider.of<CommnQuestionsCubit>(context)
                                          .title
                                          .text,
                                  titleEn:
                                      BlocProvider.of<CommnQuestionsCubit>(context)
                                          .titleEn
                                          .text,
                                  status:
                                      BlocProvider.of<CommnQuestionsCubit>(context)
                                                  .selectedOption ==
                                              'Posted'
                                          ? 1
                                          : 0,
                                  Content:
                                      BlocProvider.of<CommnQuestionsCubit>(context)
                                          .content
                                          .text,
                                  ContentEn:
                                      BlocProvider.of<CommnQuestionsCubit>(context)
                                          .contentEn
                                          .text,
                                  SortAt: int.parse(
                                      BlocProvider.of<CommnQuestionsCubit>(context)
                                          .SortAt
                                          .text));
                              BlocProvider.of<CommnQuestionsCubit>(context)
                                  .AddCommnQuestions(commnQuestionsModel);
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
