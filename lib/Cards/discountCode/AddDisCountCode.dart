import 'package:afcooadminpanel/Cards/discountCode/discountCodeModel.dart';
import 'package:afcooadminpanel/Cards/discountCode/discount_code_cubit.dart';
import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/regionModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/region_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDisCountCode extends StatelessWidget {
  AddDisCountCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<DiscountCodeCubit, DiscountCodeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text('Adding DisCountCode',
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
                                          controller: BlocProvider.of<
                                                  DiscountCodeCubit>(context)
                                              .name,
                                          onSaved: (String? value) {
                                            BlocProvider.of<DiscountCodeCubit>(
                                                    context)
                                                .name
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
                                            labelText: 'Start Date',
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            widget: TextformFieldWidghticon(
                                              HintText: '',
                                              icon: IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              DiscountCodeCubit>(
                                                          context)
                                                      .ShowDatePicker(
                                                          context,
                                                          BlocProvider.of<
                                                                      DiscountCodeCubit>(
                                                                  context)
                                                              .StartDate);
                                                },
                                                icon: Icon(Icons.date_range),
                                              ),
                                              controller: BlocProvider.of<
                                                          DiscountCodeCubit>(
                                                      context)
                                                  .StartDate,
                                              onChanged: (String? value) {},
                                            ))),
                                    Expanded(
                                        child: buildRowWithWidght(
                                            labelText: 'End Date',
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            widget: TextformFieldWidghticon(
                                              HintText: '',
                                              icon: IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              DiscountCodeCubit>(
                                                          context)
                                                      .ShowDatePicker(
                                                          context,
                                                          BlocProvider.of<
                                                                      DiscountCodeCubit>(
                                                                  context)
                                                              .EndDate);
                                                },
                                                icon: Icon(Icons.date_range),
                                              ),
                                              controller: BlocProvider.of<
                                                          DiscountCodeCubit>(
                                                      context)
                                                  .EndDate,
                                              onChanged: (String? value) {},
                                            ))),
                                  ],
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
                                          labelText: 'DiscountPercenTage',
                                          controller: BlocProvider.of<
                                                  DiscountCodeCubit>(context)
                                              .disCountPercentage,
                                          onSaved: (String? value) {
                                            BlocProvider.of<DiscountCodeCubit>(
                                                    context)
                                                .disCountPercentage
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
                                            widget: RadioListTilewidghtinColumn(
                                                selectedOption: BlocProvider.of<
                                                            DiscountCodeCubit>(
                                                        context)
                                                    .selectedOption!,
                                                onChanged: (String? value) {
                                                  BlocProvider.of<
                                                              DiscountCodeCubit>(
                                                          context)
                                                      .SelectRadioButton(value);
                                                })
                                            // Column(
                                            //   children: <Widget>[
                                            //     Expanded(
                                            //       child: RadioListTile(
                                            //         title: const Text('Posted'),
                                            //         value: 'Posted',
                                            //         groupValue: BlocProvider.of<
                                            //                     DiscountCodeCubit>(
                                            //                 context)
                                            //             .selectedOption,
                                            //         onChanged: (value) {
                                            //           BlocProvider.of<
                                            //                       DiscountCodeCubit>(
                                            //                   context)
                                            //               .SelectRadioButton(value);
                                            //         },
                                            //       ),
                                            //     ),
                                            //     Expanded(
                                            //       child: RadioListTile(
                                            //         title: const Text('NotPosted'),
                                            //         value: 'Not Posted',
                                            //         groupValue: BlocProvider.of<
                                            //                     DiscountCodeCubit>(
                                            //                 context)
                                            //             .selectedOption,
                                            //         onChanged: (value) {
                                            //           BlocProvider.of<
                                            //                       DiscountCodeCubit>(
                                            //                   context)
                                            //               .SelectRadioButton(value);
                                            //         },
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                            )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    BlocBuilder<RegionCubit, RegionState>(
                                      builder: (context, state) {
                                        return Expanded(
                                          child: buildRowWithWidght(
                                            labelText: 'Region',
                                            width: 600,
                                            widget: Container(
                                              child:
                                                  DropdownSearch<RegionModel>(
                                                clearButtonProps:
                                                    const ClearButtonProps(
                                                        isVisible: true),
                                                popupProps: PopupProps.menu(
                                                    searchDelay: const Duration(
                                                        seconds: 1),
                                                    menuProps: const MenuProps(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  24),
                                                          topRight:
                                                              Radius.circular(
                                                                  24),
                                                        ),
                                                      ),
                                                    ),
                                                    searchFieldProps:
                                                        const TextFieldProps(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        labelText: "search",
                                                      ),
                                                    ),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            RegionModel? item,
                                                            bool isSelected) {
                                                      return Container(
                                                        decoration: !isSelected
                                                            ? null
                                                            : BoxDecoration(
                                                                border: Border.all(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                        child: ListTile(
                                                          selected: isSelected,
                                                          subtitle: Text(item
                                                                  ?.name
                                                                  ?.toString() ??
                                                              ''),
                                                        ),
                                                      );
                                                    },
                                                    showSearchBox: true,
                                                    showSelectedItems: true),
                                                enabled: true,
                                                asyncItems: (String? filter) =>
                                                    BlocProvider.of<
                                                                RegionCubit>(
                                                            context)
                                                        .GetallRegionsPartner(),
                                                compareFn: (item,
                                                        selectedItem) =>
                                                    item.id == selectedItem.id,
                                                dropdownDecoratorProps:
                                                    const DropDownDecoratorProps(
                                                  dropdownSearchDecoration:
                                                      InputDecoration(
                                                    labelText: "",
                                                    hintText: "",
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 12, 8, 8),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                                onChanged: (RegionModel? data) {
                                                  BlocProvider.of<RegionCubit>(
                                                          context)
                                                      .regionModelobj = data;
                                                  BlocProvider.of<RegionCubit>(
                                                          context)
                                                      .ChangeState();
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
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
                            // DisCountCodeModel disCountCodeModel=DisCountCodeModel
                            //   (id: 0,
                            //     name: BlocProvider.of<DiscountCodeCubit>(context).name.text,
                            //     nameEn: BlocProvider.of<DiscountCodeCubit>(context).nameEn.text,
                            //     status:  BlocProvider.of<DiscountCodeCubit>(context).selectedOption == 'Posted' ? 1 : 0,
                            //     sortAt:  BlocProvider.of<DiscountCodeCubit>(context).ItemOrderCounter,
                            //     regionId:  BlocProvider.of<RegionCubit>(context).regionModelobj!.id, startDate: '', endDate: '', discountValue: null, discountType: null);
                            // BlocProvider.of<DiscountCodeCubit>(context).AddDisCountCode(disCountCodeModel);
                          },
                          title: 'Add',
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
