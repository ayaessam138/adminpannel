import 'package:afcooadminpanel/Core/dropdownmodel.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/TabTitle.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/Core/widghts/TabFooter.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';
import 'package:afcooadminpanel/Partner/partners/PartnerCubit/partner_cubit.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutPartner extends StatelessWidget {
  AboutPartner({super.key});
  // TextEditingController slugcontroller = TextEditingController();
  // TextEditingController Namecontroller = TextEditingController();
  // TextEditingController NmaeinEnglishcontroller = TextEditingController();
  // TextEditingController Descriptioncontroller = TextEditingController();
  // TextEditingController DescriptioninEnglishcontroller =
  //     TextEditingController();

  bool checkedValue = false;
  String _selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const TabTitle(Title: 'About Partner'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height*.90,
                  decoration: const BoxDecoration(color: Color(0xffFBF9F4)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: buildRowWithTextField(

                              labelText: 'Slug',
                              controller: BlocProvider.of<PartnerCubit>(context).slugcontroller,
                              onSaved: (String? value) {},
                              size: 300),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: buildRowWithTextField(
                                  labelText: 'Name',
                                  controller: BlocProvider.of<PartnerCubit>(context).Namecontroller,
                                  onSaved: (String? value) {},
                                  size: 300),
                            ),
                            Expanded(
                              child: buildRowWithTextField(
                                  labelText: 'Name in English',
                                  controller: BlocProvider.of<PartnerCubit>(context).NmaeinEnglishcontroller,
                                  onSaved: (String? value) {},
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
                                labelText: 'Card fields',
                                width: 600,
                                widget: Container(
                    // width: Dimensions.screenWidth(context) * .9,
                                  child: DropdownSearch<DDCodeListModel>(
                                    selectedItem:
                                        BlocProvider.of<PartnerCubit>(context)
                                            .recordDDCodeList,
                                    clearButtonProps:
                                        const ClearButtonProps(isVisible: true),
                                    popupProps: PopupProps.menu(
                                        searchDelay: const Duration(seconds: 1),
                                        menuProps: const MenuProps(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(24),
                                              topRight: Radius.circular(24),
                                            ),
                                          ),
                                        ),
                                        searchFieldProps: const TextFieldProps(
                                          textDirection: TextDirection.rtl,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.fromLTRB(12, 12, 8, 0),
                                            labelText: "search",
                                          ),
                                        ),
                                        itemBuilder: (BuildContext context,
                                            DDCodeListModel? item,
                                            bool isSelected) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            decoration: !isSelected
                                                ? null
                                                : BoxDecoration(
                                                    border: Border.all(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    color: Colors.white,
                                                  ),
                                            child: ListTile(
                                              selected: isSelected,
                                              title:
                                                  Text(item?.d.toString() ?? ''),
                                              subtitle:
                                                  Text(item?.v?.toString() ?? ''),
                                              leading: CircleAvatar(
                                                backgroundColor: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.sensor_occupied_sharp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        showSearchBox: true,
                                        showSelectedItems: true),
                                    enabled: true,
                    // asyncItems: (String? filter) => cubit.getCodeList(),
                                    compareFn: (item, selectedItem) =>
                                        item.v == selectedItem.v,
                                    dropdownDecoratorProps:
                                        const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        labelText: "",
                                        hintText: "",
                                        contentPadding:
                                            EdgeInsets.fromLTRB(12, 12, 8, 8),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    onChanged: (DDCodeListModel? data) {},
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: buildRowWithWidght(
                                labelText: 'Classification of services',
                                width: 600,
                                widget: Container(
                    // width: Dimensions.screenWidth(context) * .9,
                                  child: DropdownSearch<DDCodeListModel>(
                                    selectedItem:
                                        BlocProvider.of<PartnerCubit>(context)
                                            .recordDDCodeList,
                                    clearButtonProps:
                                        const ClearButtonProps(isVisible: true),
                                    popupProps: PopupProps.menu(
                                        searchDelay: const Duration(seconds: 1),
                                        menuProps: const MenuProps(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(24),
                                              topRight: Radius.circular(24),
                                            ),
                                          ),
                                        ),
                                        searchFieldProps: const TextFieldProps(
                                          textDirection: TextDirection.rtl,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.fromLTRB(12, 12, 8, 0),
                                            labelText: "search",
                                          ),
                                        ),
                                        itemBuilder: (BuildContext context,
                                            DDCodeListModel? item,
                                            bool isSelected) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            decoration: !isSelected
                                                ? null
                                                : BoxDecoration(
                                                    border: Border.all(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    color: Colors.white,
                                                  ),
                                            child: ListTile(
                                              selected: isSelected,
                                              title:
                                                  Text(item?.d.toString() ?? ''),
                                              subtitle:
                                                  Text(item?.v?.toString() ?? ''),
                                              leading: CircleAvatar(
                                                backgroundColor: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.sensor_occupied_sharp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        showSearchBox: true,
                                        showSelectedItems: true),
                                    enabled: true,
                    // asyncItems: (String? filter) => cubit.getCodeList(),
                                    compareFn: (item, selectedItem) =>
                                        item.v == selectedItem.v,
                                    dropdownDecoratorProps:
                                        const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        labelText: "",
                                        hintText: "",
                                        contentPadding:
                                            EdgeInsets.fromLTRB(12, 12, 8, 8),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    onChanged: (DDCodeListModel? data) {},
                                  ),
                                ),
                              ),
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
                                labelText: 'Region',
                                width: 600,
                                widget: Container(
                    // width: Dimensions.screenWidth(context) * .9,
                                  child: DropdownSearch<DDCodeListModel>(
                                    selectedItem:
                                        BlocProvider.of<PartnerCubit>(context)
                                            .recordDDCodeList,
                                    clearButtonProps:
                                        const ClearButtonProps(isVisible: true),
                                    popupProps: PopupProps.menu(
                                        searchDelay: const Duration(seconds: 1),
                                        menuProps: const MenuProps(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(24),
                                              topRight: Radius.circular(24),
                                            ),
                                          ),
                                        ),
                                        searchFieldProps: const TextFieldProps(
                                          textDirection: TextDirection.rtl,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.fromLTRB(12, 12, 8, 0),
                                            labelText: "search",
                                          ),
                                        ),
                                        itemBuilder: (BuildContext context,
                                            DDCodeListModel? item,
                                            bool isSelected) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            decoration: !isSelected
                                                ? null
                                                : BoxDecoration(
                                                    border: Border.all(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    color: Colors.white,
                                                  ),
                                            child: ListTile(
                                              selected: isSelected,
                                              title:
                                                  Text(item?.d.toString() ?? ''),
                                              subtitle:
                                                  Text(item?.v?.toString() ?? ''),
                                              leading: CircleAvatar(
                                                backgroundColor: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.sensor_occupied_sharp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        showSearchBox: true,
                                        showSelectedItems: true),
                                    enabled: true,
                    // asyncItems: (String? filter) => cubit.getCodeList(),
                                    compareFn: (item, selectedItem) =>
                                        item.v == selectedItem.v,
                                    dropdownDecoratorProps:
                                        const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        labelText: "",
                                        hintText: "",
                                        contentPadding:
                                            EdgeInsets.fromLTRB(12, 12, 8, 8),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    onChanged: (DDCodeListModel? data) {},
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: buildRowWithWidght(
                                labelText: 'City',
                                width: 600,
                                widget: Container(
                    // width: Dimensions.screenWidth(context) * .9,
                                  child: DropdownSearch<DDCodeListModel>(
                                    selectedItem:
                                        BlocProvider.of<PartnerCubit>(context)
                                            .recordDDCodeList,
                                    clearButtonProps:
                                        const ClearButtonProps(isVisible: true),
                                    popupProps: PopupProps.menu(
                                        searchDelay: const Duration(seconds: 1),
                                        menuProps: const MenuProps(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(24),
                                              topRight: Radius.circular(24),
                                            ),
                                          ),
                                        ),
                                        searchFieldProps: const TextFieldProps(
                                          textDirection: TextDirection.rtl,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.fromLTRB(12, 12, 8, 0),
                                            labelText: "search",
                                          ),
                                        ),
                                        itemBuilder: (BuildContext context,
                                            DDCodeListModel? item,
                                            bool isSelected) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            decoration: !isSelected
                                                ? null
                                                : BoxDecoration(
                                                    border: Border.all(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    color: Colors.white,
                                                  ),
                                            child: ListTile(
                                              selected: isSelected,
                                              title:
                                                  Text(item?.d.toString() ?? ''),
                                              subtitle:
                                                  Text(item?.v?.toString() ?? ''),
                                              leading: CircleAvatar(
                                                backgroundColor: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.sensor_occupied_sharp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        showSearchBox: true,
                                        showSelectedItems: true),
                                    enabled: true,
                    // asyncItems: (String? filter) => cubit.getCodeList(),
                                    compareFn: (item, selectedItem) =>
                                        item.v == selectedItem.v,
                                    dropdownDecoratorProps:
                                        const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        labelText: "",
                                        hintText: "",
                                        contentPadding:
                                            EdgeInsets.fromLTRB(12, 12, 8, 8),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    onChanged: (DDCodeListModel? data) {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: buildRowWithWidght(
                              labelText: 'labelText',
                              width: 200,
                              widget: UpladImageButton(onPressed: () {  },)),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: buildRowWithWidght(
                              labelText: 'labelText',
                              width: 200,
                              widget: UpladImageButton(onPressed: () {  },)),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: buildRowWithWidght(
                              labelText: 'labelText',
                              width: 200,
                              widget: UpladImageButton(onPressed: () {  },)),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                            child: buildRowWithWidght(
                                labelText: 'labelText',
                                width: 25,
                                widget: Checkbox(
                                  value: checkedValue,
                                  onChanged: (newValue) {},
                                ))),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                            child: buildRowWithWidght(
                          labelText: 'labelText',
                          width:double.infinity,
                          widget: Row(

                            children: <Widget>[
                              Expanded(
                                child: RadioListTile(
                                  title: const Text('Option 1'),
                                  value: 'Option 1',
                                  groupValue: _selectedOption,
                                  onChanged: (value) {
                                    _selectedOption = value!;
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  title: const Text('Option 2'),
                                  value: 'Option 2',
                                  groupValue: _selectedOption,
                                  onChanged: (value) {
                                    _selectedOption = value!;
                                  },
                                ),
                              ),
                              // Expanded(
                              //   child: buildRowWithTextField(
                              //       labelText: 'DesCription',
                              //       controller: Descriptioncontroller,
                              //       onSaved: (String? value) {},
                              //       size: 800,
                              //       Maxlines: 3),
                              // ),
                            ],
                          ),
                        )),

                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: buildRowWithTextField(
                              labelText: 'DesCription',
                              controller: BlocProvider.of<PartnerCubit>(context).Descriptioncontroller,
                              onSaved: (String? value) {},
                              size: 600,
                              Maxlines: 3),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: buildRowWithTextField(
                              labelText: 'DesCription in English ',
                              controller: BlocProvider.of<PartnerCubit>(context).DescriptioninEnglishcontroller,
                              onSaved: (String? value) {},
                              size: 600,
                              Maxlines: 3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            color: Color(0xffF4F4F5),
          ),
          const TabFooter(
            Title: 'Edit',
          )
        ],
      ),
    );
  }
}
// ElevatedButton(
// style: ButtonStyle(
//
//
//
// side: MaterialStateProperty.all<BorderSide>(
// const BorderSide(
// color: Color(0xffD2D6DE),
// width: 2.0,
// )),
// shape: MaterialStateProperty.all<
// RoundedRectangleBorder>(
// const RoundedRectangleBorder(
// borderRadius: BorderRadius.zero)),
// backgroundColor:
// MaterialStateProperty.all<Color?>(
// Color(0xffFFFFFF)),
// ),
// onPressed: () {
// BlocProvider.of<PartnerCubit>(context)
//     .PickImageFromGallery();
// },
// child: const Row(
// children: [
// Text(
// 'Uplaod Image',
// style:
// TextStyle(color: Color(0xff999999)),
// ),
// Icon(
// Icons.upload,
// color: Color(0xff999999),
// )
// ],
// ))
