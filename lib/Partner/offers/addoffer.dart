import 'package:afcooadminpanel/Core/RadioListTile.dart';
import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/UploadImageButton.dart';
import 'package:afcooadminpanel/Partner/offers/OffersModel.dart';
import 'package:afcooadminpanel/Partner/offers/addOfferModel.dart';
import 'package:afcooadminpanel/Partner/offers/offers_cubit.dart';
import 'package:afcooadminpanel/Partner/partners/Models/PartnerModel.dart';
import 'package:afcooadminpanel/Partner/partners/PartnerCubit/partner_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddOffers extends StatelessWidget {
  AddOffers({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<OffersCubit, OffersState>(
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
                      Text(isAdd ? 'Adding Offers' : "Editing Offers",
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
                                      BlocBuilder<PartnerCubit, PartnerState>(
                                        builder: (context, state) {
                                          return Expanded(
                                            child: buildRowWithWidght(
                                              labelText: 'Partner',
                                              width: 225,
                                              widget: Container(
                                                child: DropdownSearch<
                                                    PartnerModel>(
                                                  clearButtonProps:
                                                      const ClearButtonProps(
                                                          isVisible: true),
                                                  popupProps: PopupProps.menu(
                                                      searchDelay:
                                                          const Duration(
                                                              seconds: 1),
                                                      menuProps:
                                                          const MenuProps(
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
                                                      itemBuilder: (BuildContext
                                                              context,
                                                          PartnerModel? item,
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
                                                            selected:
                                                                isSelected,
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
                                                  asyncItems: (String?
                                                          filter) =>
                                                      BlocProvider.of<
                                                                  PartnerCubit>(
                                                              context)
                                                          .GetallPartners(),
                                                  compareFn: (item,
                                                          selectedItem) =>
                                                      item.id ==
                                                      selectedItem.id,
                                                  dropdownDecoratorProps: DropDownDecoratorProps(
                                                      dropdownSearchDecoration:
                                                          buildInputDecoration()
                                                      //     InputDecoration(
                                                      //   labelText: "",
                                                      //   hintText: "",
                                                      //   contentPadding:
                                                      //       EdgeInsets.fromLTRB(
                                                      //           12, 12, 8, 8),
                                                      //   border:
                                                      //       OutlineInputBorder(),
                                                      // ),
                                                      ),
                                                  onChanged:
                                                      (PartnerModel? data) {
                                                    BlocProvider.of<
                                                                PartnerCubit>(
                                                            context)
                                                        .PartnerModelObj = data;
                                                    BlocProvider.of<
                                                                PartnerCubit>(
                                                            context)
                                                        .Changestate();
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
                                                BlocProvider.of<OffersCubit>(
                                                        context)
                                                    .name,
                                            onSaved: (String? value) {
                                              BlocProvider.of<OffersCubit>(
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
                                            labelText: 'Name In English',
                                            controller:
                                                BlocProvider.of<OffersCubit>(
                                                        context)
                                                    .nameEn,
                                            onSaved: (String? value) {
                                              BlocProvider.of<OffersCubit>(
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
                                  buildRowWithWidght(
                                      labelText: 'Image',
                                      width: 200,
                                      widget: UpladImageButton(
                                        onPressed: () {
                                          BlocProvider.of<OffersCubit>(context)
                                              .PickImage();
                                        },
                                      )),
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
                                      labelText: 'Decscription',
                                      controller:
                                          BlocProvider.of<OffersCubit>(context)
                                              .desCription,
                                      onSaved: (String? value) {
                                        BlocProvider.of<OffersCubit>(context)
                                            .desCription
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
                                      labelText: 'Description in English',
                                      controller:
                                          BlocProvider.of<OffersCubit>(context)
                                              .descriptonEn,
                                      onSaved: (String? value) {
                                        BlocProvider.of<OffersCubit>(context)
                                            .descriptonEn
                                            .text = value!;
                                      },
                                      size: 600),
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
                                              widget:
                                                  RadioListTilewidghtinColumn(
                                                selectedOption: BlocProvider.of<
                                                        OffersCubit>(context)
                                                    .selectedOption,
                                                onChanged: (val) {
                                                  BlocProvider.of<OffersCubit>(
                                                          context)
                                                      .SelectRadioButton(val);
                                                },
                                              ))),
                                    ],
                                  )
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
                              AddOfferimage addOfferimage = AddOfferimage(
                                image: BlocProvider.of<OffersCubit>(context)
                                    .selectedImageUnit8List,
                              );
                              print('addOfferimage');
                              print(addOfferimage.image);
                              OffersModel addOfferModel = OffersModel(
                                id: 0,
                                name: BlocProvider.of<OffersCubit>(context)
                                    .name
                                    .text,
                                nameEn: BlocProvider.of<OffersCubit>(context)
                                    .nameEn
                                    .text,
                                status: BlocProvider.of<OffersCubit>(context)
                                            .selectedOption ==
                                        'Posted'
                                    ? 1
                                    : 0,
                                partnerId:
                                    BlocProvider.of<PartnerCubit>(context)
                                        .PartnerModelObj!
                                        .id,
                                description:
                                    BlocProvider.of<OffersCubit>(context)
                                        .desCription
                                        .text,
                                descriptionEn:
                                    BlocProvider.of<OffersCubit>(context)
                                        .descriptonEn
                                        .text,
                              );
                              BlocProvider.of<OffersCubit>(context).Addofffer(
                                  addOfferModel: addOfferModel,
                                  addOfferimage: addOfferimage);
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
