import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/regionModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/region_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRegion extends StatelessWidget {
  const AddRegion({super.key, required this.isAdd});
  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<RegionCubit, RegionState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(isAdd ? 'Adding Region' : 'Editing Region',
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
                                          labelText: 'Name',
                                          controller:
                                              BlocProvider.of<RegionCubit>(
                                                      context)
                                                  .name,
                                          onSaved: (String? value) {
                                            BlocProvider.of<RegionCubit>(
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
                                          labelText: 'Name in English',
                                          controller:
                                              BlocProvider.of<RegionCubit>(
                                                      context)
                                                  .nameEn,
                                          onSaved: (String? value) {
                                            BlocProvider.of<RegionCubit>(
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
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      widget: RadioListTilewidghtinColumn(
                                          selectedOption:
                                              BlocProvider.of<RegionCubit>(
                                                      context)
                                                  .selectedOption,
                                          onChanged: (String? value) {
                                            BlocProvider.of<RegionCubit>(
                                                    context)
                                                .SelectRadioButton(value);
                                          }),

                                      // Column(
                                      //   children: <Widget>[
                                      //     Expanded(
                                      //       child: RadioListTile(
                                      //         title: Text('Posted'),
                                      //         value: 'Posted',
                                      //         groupValue:
                                      //         BlocProvider.of<RegionCubit>(
                                      //             context)
                                      //             .selectedOption,
                                      //         onChanged: (value) {
                                      //           BlocProvider.of<RegionCubit>(
                                      //               context)
                                      //               .SelectRadioButton(value);
                                      //         },
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       child: RadioListTile(
                                      //         title: Text('NotPosted'),
                                      //         value: 'Not Posted',
                                      //         groupValue:
                                      //         BlocProvider.of<RegionCubit>(
                                      //             context)
                                      //             .selectedOption,
                                      //         onChanged: (value) {
                                      //           BlocProvider.of<RegionCubit>(
                                      //               context)
                                      //               .SelectRadioButton(value);
                                      //         },
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    )),
                                    Expanded(
                                      child: buildRowWithTextField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Field is required';
                                            }
                                            return '';
                                          },
                                          labelText: 'Sort At',
                                          controller:
                                              BlocProvider.of<RegionCubit>(
                                                      context)
                                                  .sortAt,
                                          onSaved: (String? value) {
                                            BlocProvider.of<RegionCubit>(
                                                    context)
                                                .sortAt
                                                .text = value!;
                                          },
                                          size: 300),
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
                        const Divider(
                          color: Color(0xffECF0F5),
                          thickness: 2,
                        ),
                        CustomButton(
                          onTap: () async {
                            RegionModel regionModelobj = RegionModel(
                              id: 0,
                              name: BlocProvider.of<RegionCubit>(context)
                                  .name
                                  .text,
                              nameEn: BlocProvider.of<RegionCubit>(context)
                                  .nameEn
                                  .text,
                              status: BlocProvider.of<RegionCubit>(context)
                                          .selectedOption ==
                                      'Posted'
                                  ? 1
                                  : 0,
                              sortAt: int.parse(
                                  BlocProvider.of<RegionCubit>(context)
                                      .sortAt
                                      .text),
                            );
                            await BlocProvider.of<RegionCubit>(context)
                                .AddRegion(regionModelobj);

                            // var cubit=BlocProvider.of<RegionCubit>(context);
                            // cubit.nameEn.text='';
                            // cubit.name.text='';
                            // cubit.sortAt.text='';
                            // cubit.selectedOption='';
                          },
                          title: isAdd ? "Add" : "Edit",
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
          );
        },
      ),
    );
  }
}

/*
import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/regionModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/region_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRegion extends StatelessWidget {
  const AddRegion(*/
/*{super.key, required this.isAdd, required this.regionModel}*/ /*
);
  // final bool isAdd;
  // final RegionModel regionModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<RegionCubit, RegionState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(isAdd ? 'Adding Region' : "Editing Region",
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
                                          labelText: 'Name',
                                          controller: isAdd
                                              ? BlocProvider.of<RegionCubit>(
                                              context)
                                              .name
                                              : TextEditingController(
                                              text: regionModel.name),
                                          onSaved: (String? value) {
                                            BlocProvider.of<RegionCubit>(
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
                                          labelText: 'Name in English',
                                          controller: isAdd
                                              ? BlocProvider.of<RegionCubit>(
                                              context)
                                              .nameEn
                                              : TextEditingController(
                                              text: regionModel.nameEn),
                                          onSaved: (String? value) {
                                            BlocProvider.of<RegionCubit>(
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
                                          width: MediaQuery.of(context).size.width,
                                          height: 100,
                                          widget: RadioListTilewidghtinColumn(
                                              selectedOption: isAdd
                                                  ? BlocProvider.of<RegionCubit>(
                                                  context)
                                                  .selectedOption
                                                  : regionModel.status == 1
                                                  ? 'Posted'
                                                  : 'NotPosted',
                                              onChanged: (String? value) {
                                                BlocProvider.of<RegionCubit>(
                                                    context)
                                                    .SelectRadioButton(value);
                                              }),

                                          // Column(
                                          //   children: <Widget>[
                                          //     Expanded(
                                          //       child: RadioListTile(
                                          //         title: Text('Posted'),
                                          //         value: 'Posted',
                                          //         groupValue:
                                          //         BlocProvider.of<RegionCubit>(
                                          //             context)
                                          //             .selectedOption,
                                          //         onChanged: (value) {
                                          //           BlocProvider.of<RegionCubit>(
                                          //               context)
                                          //               .SelectRadioButton(value);
                                          //         },
                                          //       ),
                                          //     ),
                                          //     Expanded(
                                          //       child: RadioListTile(
                                          //         title: Text('NotPosted'),
                                          //         value: 'Not Posted',
                                          //         groupValue:
                                          //         BlocProvider.of<RegionCubit>(
                                          //             context)
                                          //             .selectedOption,
                                          //         onChanged: (value) {
                                          //           BlocProvider.of<RegionCubit>(
                                          //               context)
                                          //               .SelectRadioButton(value);
                                          //         },
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                        )),
                                    Expanded(
                                      child: buildRowWithTextField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Field is required';
                                            }
                                            return '';
                                          },
                                          labelText: 'Sort At',
                                          controller: isAdd
                                              ? BlocProvider.of<RegionCubit>(
                                              context)
                                              .sortAt
                                              : TextEditingController(
                                              text: regionModel.sortAt
                                                  .toString()),
                                          onSaved: (String? value) {
                                            BlocProvider.of<RegionCubit>(
                                                context)
                                                .sortAt
                                                .text = value!;
                                          },
                                          size: 300),
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
                        const Divider(
                          color: Color(0xffECF0F5),
                          thickness: 2,
                        ),
                        CustomButton(
                          onTap: () {

                            RegionModel regionModelobj = RegionModel(
                              id: isAdd ? 0 : regionModel.id,
                              name: BlocProvider.of<RegionCubit>(context)
                                  .name
                                  .text,
                              nameEn: BlocProvider.of<RegionCubit>(context)
                                  .nameEn
                                  .text,
                              status: BlocProvider.of<RegionCubit>(context)
                                  .selectedOption ==
                                  'Posted'
                                  ? 1
                                  : 0,
                              sortAt: int.parse(
                                  BlocProvider.of<RegionCubit>(context)
                                      .sortAt
                                      .text),
                            );
                            BlocProvider.of<RegionCubit>(context)
                                .AddRegion(regionModelobj);
                          },
                          title: isAdd ? 'Add' : 'Edit',
                          height: 40,
                          width: 120,
                          textcolor: Colors.white,
                          backGroundcolor: Color(0xff095A56),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
*/
