import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';
import 'package:afcooadminpanel/Core/widghts/filterDropdownList.dart';
import 'package:afcooadminpanel/EmailMeesages/emaillistgroups/EmaillistgroupsModel.dart';
import 'package:afcooadminpanel/EmailMeesages/emaillistgroups/email_list_grpoup_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmailListGroup extends StatelessWidget {
  AddEmailListGroup({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<EmailListGrpoupCubit, EmailListGrpoupState>(
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
                              ? 'Adding EmailListGrpoup'
                              : "Editing EmailListGrpoup",
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
                                              labelText: 'GroupTitle',
                                              controller: BlocProvider.of<
                                                          EmailListGrpoupCubit>(
                                                      context)
                                                  .GroupTitle,
                                              onSaved: (String? value) {
                                                BlocProvider.of<
                                                            EmailListGrpoupCubit>(
                                                        context)
                                                    .GroupTitle
                                                    .text = value!;
                                              },
                                              size: 600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
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
                              EmailListGrpoupModel addEmailListGrpoupModel =
                                  EmailListGrpoupModel(
                                Groupname:
                                    BlocProvider.of<EmailListGrpoupCubit>(
                                            context)
                                        .GroupTitle
                                        .text,
                                id: 0,
                              );
                              BlocProvider.of<EmailListGrpoupCubit>(context)
                                  .AddEmailListGrpoup(
                                      emailListGrpoupModel:
                                          addEmailListGrpoupModel);
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
