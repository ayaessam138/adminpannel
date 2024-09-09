import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabTitle.dart';
import 'package:afcooadminpanel/Core/widghts/TabFooter.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/Core/widghts/filterDropdownList.dart';
import 'package:afcooadminpanel/Partner/partners/PartnerCubit/partner_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';






class Services extends StatelessWidget {
  Services({Key? key});

  // TextEditingController nameController = TextEditingController();
  // TextEditingController nameInEnglish = TextEditingController();
  // TextEditingController discountPercent = TextEditingController();
  // TextEditingController price = TextEditingController();
  // TextEditingController priceAfterDiscount = TextEditingController();
  // TextEditingController itemOrder = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const TabTitle(
            Title: 'Services',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                // decoration: const BoxDecoration(color: Color(0xffFBF9F4)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      buildRowWithWidght(
                        flex: 4,
                        labelText: 'Services',
                        width: MediaQuery.of(context).size.width,
                        widget: Container(
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xffDDDDDD)),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffDDDDDD)),
                                  color: const Color(0xffF5F5F5),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'service',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(color: Colors.white,height: 12,),
                              Container(
                                color: const Color(0xffFBF9F4),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [

                                      Row(
                                        children: [
                                          Expanded(
                                            child: buildRowWithTextField(
                                              labelText: 'Name',
                                              controller: BlocProvider.of<PartnerCubit>(context).name,
                                              onSaved: (String? value) {},
                                              size: 300,
                                            ),
                                          ),
                                          Expanded(
                                            child: buildRowWithTextField(
                                              labelText: 'Name In English',
                                              controller: BlocProvider.of<PartnerCubit>(context).nameEn,
                                              onSaved: (String? value) {},
                                              size: 300,
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
                                                labelText: 'Discount Type',
                                                width: 300,
                                                widget: DropdownList(
                                                    Options: ['Option 1', 'Option 2', 'Option 3']
                                                        .map((String value) => DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    ))
                                                        .toList(),
                                                    Hint: '',
                                                    onChanged: (value) {})),
                                          ),
                                          Expanded(
                                            child: buildRowWithWidght(
                                                labelText: 'Discount Percent',
                                                width: 300,
                                                widget:
                                                TextformFieldWidghtwithCounter(
                                                  controller: BlocProvider.of<PartnerCubit>(context).discountPercent,
                                                  onChanged: (value) {},
                                                  onPressedIncrement: () {},
                                                  onPressedDecrement: () {},
                                                )),
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
                                                labelText: 'Price',
                                                width: 300,
                                                widget:
                                                TextformFieldWidghtwithCounter(
                                                  controller: BlocProvider.of<PartnerCubit>(context).price,
                                                  onChanged: (value) {},
                                                  onPressedIncrement: () {},
                                                  onPressedDecrement: () {},
                                                )),
                                          ),
                                          Expanded(
                                            child: buildRowWithWidght(
                                                labelText:
                                                'Price After Discount',
                                                width: 300,
                                                widget:
                                                TextformFieldWidghtwithCounter(
                                                  controller:
                                                  BlocProvider.of<PartnerCubit>(context).priceAfterDiscount,
                                                  onChanged: (value) {},
                                                  onPressedIncrement: () {},
                                                  onPressedDecrement: () {},
                                                )),
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
                                                width: 300,
                                                widget: DropdownList(
                                                    Options: ['Option 1', 'Option 2', 'Option 3']
                                                        .map((String value) => DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    ))
                                                        .toList(),
                                                    Hint: '',
                                                    onChanged: (value) {})),
                                          ),
                                          Expanded(
                                            child: buildRowWithWidght(
                                                labelText: 'Item Order',
                                                width: 300,
                                                widget:
                                                TextformFieldWidghtwithCounter(
                                                  controller: BlocProvider.of<PartnerCubit>(context).itemOrder,
                                                  onChanged: (value) {},
                                                  onPressedIncrement: () {},
                                                  onPressedDecrement: () {},
                                                )),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12,),
                                    ],
                                  ),
                                ),
                              ),
                              Container(color: Colors.white,height: 12,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            color: Color(0xffF4F4F5),
          ),
          const TabFooter(
            Title: 'Edit',
          ),
        ],
      ),
    );
  }
}

























// class Services extends StatelessWidget {
//   Services({Key? key});
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController nameInEnglish = TextEditingController();
//   TextEditingController discountPercent = TextEditingController();
//   TextEditingController price = TextEditingController();
//   TextEditingController priceAfterDiscount = TextEditingController();
//   TextEditingController itemOrder = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 40,
//           ),
//           const TabTitle(
//             Title: 'Services',
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//               child: Container(
//                 // decoration: const BoxDecoration(color: Color(0xffFBF9F4)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       buildRowWithWidght(
//                         flex: 4,
//                         labelText: 'Services',
//                         width: MediaQuery.of(context).size.width,
//                         widget: Container(
//                           decoration: BoxDecoration(
//                             border:
//                             Border.all(color: const Color(0xffDDDDDD)),
//                             borderRadius: BorderRadius.circular(3),
//                           ),
//                           child: Column(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: const Color(0xffDDDDDD)),
//                                   color: const Color(0xffF5F5F5),
//                                 ),
//                                 child: const Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                         'service',
//                                         style: TextStyle(color: Colors.black),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(color: Colors.white,height: 12,),
//                               Container(
//                                 color: const Color(0xffFBF9F4),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     children: [
//
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                             child: buildColumnWithTextField(
//                                               labelText: 'Name',
//                                               controller: nameController,
//                                               onSaved: (String? value) {},
//                                               size: 300,
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: buildColumnWithTextField(
//                                               labelText: 'Name In English',
//                                               controller: nameInEnglish,
//                                               onSaved: (String? value) {},
//                                               size: 300,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 12,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                             child: buildRowWithWidght(
//                                                 labelText: 'Discount Type',
//                                                 width: 300,
//                                                 widget: DropdownList(
//                                                     Options: ['Option 1', 'Option 2', 'Option 3']
//                                                         .map((String value) => DropdownMenuItem<String>(
//                                                       value: value,
//                                                       child: Text(value),
//                                                     ))
//                                                         .toList(),
//                                                     Hint: '',
//                                                     onChanged: (value) {})),
//                                           ),
//                                           Expanded(
//                                             child: buildRowWithWidght(
//                                                 labelText: 'Discount Percent',
//                                                 width: 300,
//                                                 widget:
//                                                 TextformFieldWidghtwithCounter(
//                                                   controller: discountPercent,
//                                                   onSaved: (value) {},
//                                                   onPressedIncrement: () {},
//                                                   onPressedDecrement: () {},
//                                                 )),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 12,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                             child: buildRowWithWidght(
//                                                 labelText: 'Price',
//                                                 width: 300,
//                                                 widget:
//                                                 TextformFieldWidghtwithCounter(
//                                                   controller: price,
//                                                   onSaved: (value) {},
//                                                   onPressedIncrement: () {},
//                                                   onPressedDecrement: () {},
//                                                 )),
//                                           ),
//                                           Expanded(
//                                             child: buildRowWithWidght(
//                                                 labelText:
//                                                 'Price After Discount',
//                                                 width: 300,
//                                                 widget:
//                                                 TextformFieldWidghtwithCounter(
//                                                   controller:
//                                                   priceAfterDiscount,
//                                                   onSaved: (value) {},
//                                                   onPressedIncrement: () {},
//                                                   onPressedDecrement: () {},
//                                                 )),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 12,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                             child: buildRowWithWidght(
//                                                 labelText: 'Case',
//                                                 width: 300,
//                                                 widget: DropdownList(
//                                                     Options: ['Option 1', 'Option 2', 'Option 3']
//                                                         .map((String value) => DropdownMenuItem<String>(
//                                                       value: value,
//                                                       child: Text(value),
//                                                     ))
//                                                         .toList(),
//                                                     Hint: '',
//                                                     onChanged: (value) {})),
//                                           ),
//                                           Expanded(
//                                             child: buildRowWithWidght(
//                                                 labelText: 'Item Order',
//                                                 width: 300,
//                                                 widget:
//                                                 TextformFieldWidghtwithCounter(
//                                                   controller: itemOrder,
//                                                   onSaved: (value) {},
//                                                   onPressedIncrement: () {},
//                                                   onPressedDecrement: () {},
//                                                 )),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 12,),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Container(color: Colors.white,height: 12,),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const Divider(
//             color: Color(0xffF4F4F5),
//           ),
//           const TabFooter(
//             Title: 'Edit',
//           ),
//         ],
//       ),
//     );
//   }
// }