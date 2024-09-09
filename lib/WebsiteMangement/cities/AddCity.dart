import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabTitle.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/WebsiteMangement/cities/cities_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/cities/cityModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/regionModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/region_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCity extends StatelessWidget {
  AddCity({super.key, required this.isAdd});
  // CityModel cityModel;
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    print('isAdd');
    print(isAdd);

    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<CitiesCubit, CitiesState>(
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
                    Text(isAdd ? 'Adding City' : 'Editing City',
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
                                    BlocBuilder<RegionCubit, RegionState>(
                                      builder: (context, state) {
                                        return Expanded(
                                          child: buildRowWithWidght(
                                            labelText: 'Region',
                                            width: 225,
                                            widget: Container(
                                              child:
                                                  DropdownSearch<RegionModel>(
                                                popupProps: PopupProps.menu(
                                                    searchDelay: const Duration(
                                                        seconds: 1),
                                                    // menuProps: const MenuProps(
                                                    //
                                                    //     ),
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
                                                                color:
                                                                    Colors.white,
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
                                                    DropDownDecoratorProps(
                                                  dropdownSearchDecoration:
                                                      buildInputDecoration(),

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
                                              BlocProvider.of<CitiesCubit>(
                                                      context)
                                                  .name,
                                          onSaved: (String? value) {
                                            BlocProvider.of<CitiesCubit>(
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
                                              BlocProvider.of<CitiesCubit>(
                                                      context)
                                                  .nameEn,
                                          onSaved: (String? value) {
                                            BlocProvider.of<CitiesCubit>(
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
                                          labelText: 'Item Order',
                                          width: 300,
                                          widget:
                                              TextformFieldWidghtwithCounter(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Field is required';
                                              }
                                            },
                                            controller:
                                                BlocProvider.of<CitiesCubit>(
                                                        context)
                                                    .ItemOrder,
                                            onChanged: (value) {
                                              BlocProvider.of<CitiesCubit>(
                                                      context)
                                                  .SaveItemOrderCount(value);
                                            },
                                            onPressedIncrement: () {
                                              BlocProvider.of<CitiesCubit>(
                                                      context)
                                                  .IncrementItemOrderCounter();
                                            },
                                            onPressedDecrement: () {
                                              BlocProvider.of<CitiesCubit>(
                                                      context)
                                                  .DecrementItemOrderCounter();
                                            },
                                          )),
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
                                                        CitiesCubit>(context)
                                                    .selectedOption,
                                                onChanged: (String? value) {
                                                  BlocProvider.of<CitiesCubit>(
                                                          context)
                                                      .SelectRadioButton(value);
                                                })
                                            // Column(
                                            //   children: <Widget>[
                                            //     Expanded(
                                            //       child: RadioListTile(
                                            //         title: Text('Posted'),
                                            //         value: 'Posted',
                                            //         groupValue:
                                            //             BlocProvider.of<CitiesCubit>(
                                            //                     context)
                                            //                 .selectedOption,
                                            //         onChanged: (value) {
                                            //           BlocProvider.of<CitiesCubit>(
                                            //                   context)
                                            //               .SelectRadioButton(value);
                                            //         },
                                            //       ),
                                            //     ),
                                            //     Expanded(
                                            //       child: RadioListTile(
                                            //         title: Text('NotPosted'),
                                            //         value: 'Not Posted',
                                            //         groupValue:
                                            //             BlocProvider.of<CitiesCubit>(
                                            //                     context)
                                            //                 .selectedOption,
                                            //         onChanged: (value) {
                                            //           BlocProvider.of<CitiesCubit>(
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
                            CityModel cityModel = CityModel(
                                id: 0,
                                name: BlocProvider.of<CitiesCubit>(context)
                                    .name
                                    .text,
                                nameEn: BlocProvider.of<CitiesCubit>(context)
                                    .nameEn
                                    .text,
                                status: BlocProvider.of<CitiesCubit>(context)
                                            .selectedOption ==
                                        'Posted'
                                    ? 1
                                    : 0,
                                sortAt: BlocProvider.of<CitiesCubit>(context)
                                    .ItemOrderCounter,
                                regionId: BlocProvider.of<RegionCubit>(context)
                                    .regionModelobj!
                                    .id);
                            await BlocProvider.of<CitiesCubit>(context)
                                .AddCity(cityModel);

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
          );
        },
      ),
    );
  }


}
