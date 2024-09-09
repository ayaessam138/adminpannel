import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TableRowWidght.dart';
import 'package:afcooadminpanel/Core/widghts/app_bar_widght.dart';
import 'package:afcooadminpanel/Partner/partners/Models/PartnerById.dart';
import 'package:afcooadminpanel/Partner/partners/Models/PartnerModel.dart';
import 'package:afcooadminpanel/Partner/partners/PartnerCubit/partner_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ShowPartnerDetails extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Table(
//           columnWidths: {
//             0: FixedColumnWidth(MediaQuery.of(context).size.width*.20), // Width for the first column
//             1: FixedColumnWidth(MediaQuery.of(context).size.width*.80)
//           },
//           border: TableBorder.all(),
//           children: [
//
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: const Text(
//                       'number',
//                     ),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'slug',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'keywords',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'meta_description',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'name',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'english_name',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'logo',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'contract',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'description',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'english_description',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'address',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'english_address',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'mobile',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'whatsapp',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'phone',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'email',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'city',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'region',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'social_facebook',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'social_twitter',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'social_youtube',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'social_linkedin',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'social_instagram',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'social_whatsapp',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'social_snapchat',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'longitude',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'latitude',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'addition_date',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'featured',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'status',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//             TableRow(
//               children: [
//                 TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         child: const Text(
//                       'unpublished',
//                     )),
//                   ),
//                 ),
//                 const TableCell(
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Value'),
//                   ),
//                 ),
//               ],
//             ),
//
//             // TableRow(
//             //   children: [
//             //     TableCell(
//             //       child: Padding(
//             //         padding: EdgeInsets.all(8.0),
//             //         child: Text('John'),
//             //       ),
//             //     ),
//             //     TableCell(
//             //       child: Padding(
//             //         padding: EdgeInsets.all(8.0),
//             //         child: Text('Doe'),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             // TableRow(
//             //   children: [
//             //     TableCell(
//             //       child: Padding(
//             //         padding: EdgeInsets.all(8.0),
//             //         child: Text('Jane'),
//             //       ),
//             //     ),
//             //     TableCell(
//             //       child: Padding(
//             //         padding: EdgeInsets.all(8.0),
//             //         child: Text('Smith'),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             // Add more rows as needed
//           ],
//         ),
//       ),
//     );
//   }
// }
class ShowPartnerDetails extends StatelessWidget {


  ShowPartnerDetails({super.key, required this.partnerbyIdModel});
  final PartnerModel partnerbyIdModel;
  List<String> keysList = [
    "slug",
    "keywords",
    "meta_description",
    "name",
    "english_name",
    "logo",
    "contract",
    "description",
    "english_description",
    "address",
    "english_address",
    "mobile",
    "whatsapp",
    "phone",
    "email",
    "city",
    "region",
    "social_facebook",
    "social_twitter",
    "social_youtube",
    "social_linkedin",
    "social_instagram",
    "social_whatsapp",
    "social_snapchat",
    "longitude",
    "latitude",
    "addition_date",
    "featured",
    "status",
    "unpublished",
    "user_created_id"
  ];
  String getValueForKey(String key) {
    switch (key) {
      case "slug":
        return partnerbyIdModel.slug ?? "";
      case "keywords":
        return partnerbyIdModel.keysWord ?? "";
      case "meta_description":
        return partnerbyIdModel.metaDescription ?? "";
      case "name":
        return partnerbyIdModel.name ?? "";
      case "english_name":
        return partnerbyIdModel.name_en ?? "";
      case "logo":
        return partnerbyIdModel.logo ?? "";
      case "contract":
        return partnerbyIdModel.contract ?? "";
      case "description":
        return partnerbyIdModel.description ?? "";
      case "english_description":
        return partnerbyIdModel.descriptionEn ?? "";
      case "address":
        return partnerbyIdModel.address ?? "";
      case "english_address":
        return partnerbyIdModel.addressEn ?? "";
      case "mobile":
        return partnerbyIdModel.mobile ?? "";
      case "whatsapp":
        return partnerbyIdModel.whatsapp ?? "";
      case "phone":
        return partnerbyIdModel.phone ?? "";
      case "email":
        return partnerbyIdModel.email ?? "";
      case "city":
        return partnerbyIdModel.cityId.toString() ?? "";
      case "region":
        return partnerbyIdModel.regionId.toString() ?? "";
      case "social_facebook":
        return partnerbyIdModel.listSocial ?? "";
      case "social_twitter":
        return partnerbyIdModel.listSocial ?? "";
      case "social_youtube":
        return partnerbyIdModel.listSocial ?? "";
      case "social_linkedin":
        return partnerbyIdModel.listSocial ?? "";
      case "social_instagram":
        return partnerbyIdModel.listSocial ?? "";
      case "social_whatsapp":
        return partnerbyIdModel.listSocial ?? "";
      case "social_snapchat":
        return partnerbyIdModel.listSocial ?? "";
      case "longitude":
        return partnerbyIdModel.lng .toString()?? "";
      case "latitude":
        return partnerbyIdModel.lat .toString()?? "";
      case "addition_date":
        return partnerbyIdModel.createdDate.toString();
      case "featured":
        return partnerbyIdModel.isFeatured.toString() ?? "";
      case "status":
        return partnerbyIdModel.status.toString() ?? "";
      case "unpublished":
        return partnerbyIdModel.status.toString() ?? "";
      case "user_created_id":
        return partnerbyIdModel.userCreatedId.toString() ?? "";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),

      body: BlocBuilder<PartnerCubit, PartnerState>(
        builder: (context, state) {
          return Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(width: 3, color: Color(0xff3C8DBC)))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomButton(
                              title: 'Edit',
                              height: MediaQuery.of(context).size.height * .06,
                              width: MediaQuery.of(context).size.width * .07,
                              textcolor: Colors.white,
                              backGroundcolor: const Color(0xff3E7D7A),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            CustomButton(
                              title: 'Delte',
                              height: MediaQuery.of(context).size.height * .06,
                              width: MediaQuery.of(context).size.width * .07,
                              textcolor: Colors.white,
                              backGroundcolor: const Color(0xffDE6D23),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: keysList.length, // Number of rows
                            itemBuilder: (context, index) {
                              String key = keysList[index];
                              String value = getValueForKey(key);
                              return TableRowWidget(
                                cell1Text: key,
                                cell2Text: value,
                                color: index % 2 == 1
                                    ? const Color(0xffF9F9F9)
                                    : Colors.white,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


