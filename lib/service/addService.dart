import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/Core/widghts/filterDropdownList.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/regionModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/region_cubit.dart';
import 'package:afcooadminpanel/service/service_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddService extends StatelessWidget {
   AddService({super.key});
String ?Status;
String ?DisCountType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<ServiceCubit, ServiceState>(
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
                    Text('Adding Service',
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
                                              BlocProvider.of<ServiceCubit>(
                                                      context)
                                                  .name,
                                          onSaved: (String? value) {
                                            BlocProvider.of<ServiceCubit>(
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
                                              BlocProvider.of<ServiceCubit>(
                                                      context)
                                                  .nameEn,
                                          onSaved: (String? value) {
                                            BlocProvider.of<ServiceCubit>(
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
                                          labelText: 'Discount Percentage',
                                          width: 300,
                                          widget:
                                              TextformFieldWidghtwithCounter(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Field is required';
                                              }
                                            },
                                            controller:
                                                BlocProvider.of<ServiceCubit>(
                                                        context)
                                                    .DiscountPercentage,
                                            onChanged: (value) {
                                              BlocProvider.of<ServiceCubit>(
                                                      context)
                                                  .SaveDiscountPercentageCount(
                                                      value);
                                            },
                                            onPressedIncrement: () {
                                              BlocProvider.of<ServiceCubit>(
                                                      context)
                                                  .IncrementDiscountPercentageCounter();
                                            },
                                            onPressedDecrement: () {
                                              BlocProvider.of<ServiceCubit>(
                                                      context)
                                                  .DecrementDiscountPercentageCounter();
                                            },
                                          )),
                                    ),
                                    Expanded(
                                      child: buildRowWithWidght(
                                          labelText: 'DisCount Type',
                                          width: 300,
                                          widget: DropdownList(
                                              selectedvalue: DisCountType,
                                              Options:
                                              BlocProvider.of<ServiceCubit>(
                                                  context)
                                                  .DisCountType
                                                  .map((option) {
                                                return DropdownMenuItem<String>(
                                                  value: option,
                                                  child: Text(option),
                                                );
                                              }).toList(),
                                              Hint: '',
                                              onChanged: (val) {

                                                DisCountType=val;
                                                BlocProvider.of<ServiceCubit>(context).ChangeState();
                                              })),
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
                                          labelText: 'Price',
                                          controller:
                                              BlocProvider.of<ServiceCubit>(
                                                      context)
                                                  .price,
                                          onSaved: (String? value) {
                                            BlocProvider.of<ServiceCubit>(
                                                    context)
                                                .price
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
                                          labelText: 'Discount Price',
                                          controller:
                                              BlocProvider.of<ServiceCubit>(
                                                      context)
                                                  .discountPrice,
                                          onSaved: (String? value) {
                                            BlocProvider.of<ServiceCubit>(
                                                    context)
                                                .discountPrice
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
                                          labelText: 'Item Order',
                                          controller:
                                              BlocProvider.of<ServiceCubit>(
                                                      context)
                                                  .sortAt,
                                          onSaved: (String? value) {
                                            BlocProvider.of<ServiceCubit>(
                                                    context)
                                                .sortAt
                                                .text = value!;
                                          },
                                          size: 300),
                                    ),
                                    Expanded(
                                      child: buildRowWithWidght(
                                          labelText: 'Status',
                                          width: 300,
                                          widget: DropdownList(
                                            selectedvalue: Status,
                                              Options:
                                                  BlocProvider.of<ServiceCubit>(
                                                          context)
                                                      .Status
                                                      .map((option) {
                                                return DropdownMenuItem<String>(
                                                  value: option,
                                                  child: Text(option),
                                                );
                                              }).toList(),
                                              Hint: '',
                                              onChanged: (val) {

                                                Status=val;
                                                BlocProvider.of<ServiceCubit>(context).ChangeState();
                                              })),
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
                          onTap: () {},
                          title: 'Add',
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
