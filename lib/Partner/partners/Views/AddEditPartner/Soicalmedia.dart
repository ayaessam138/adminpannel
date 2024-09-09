import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/TabTitle.dart';
import 'package:afcooadminpanel/Core/widghts/TexFormField.dart';
import 'package:afcooadminpanel/Core/widghts/TabFooter.dart';
import 'package:afcooadminpanel/Partner/partners/PartnerCubit/partner_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoicalMedia extends StatelessWidget {
  SoicalMedia({super.key});
  // TextEditingController Facebookcontroller = TextEditingController();
  // TextEditingController Youtubecontroller = TextEditingController();
  // TextEditingController instgramcontroller = TextEditingController();
  // TextEditingController Whatsapcontroller = TextEditingController();
  // TextEditingController Twittercontroller = TextEditingController();
  // TextEditingController Linkdencontroller = TextEditingController();
  // TextEditingController SnapChatcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const TabTitle(Title: 'Soical Media'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xffFBF9F4)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: buildRowWithTextField(
                              labelText: 'Facebook',
                              controller: BlocProvider.of<PartnerCubit>(context).Facebookcontroller,
                              onSaved: (String? value) {},
                              size: 300),
                        ),
                        Expanded(
                          child: buildRowWithTextField(
                              labelText: 'Tiwtter',
                              controller: BlocProvider.of<PartnerCubit>(context).Twittercontroller,
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
                          child: buildRowWithTextField(
                              labelText: 'YouTube',
                              controller: BlocProvider.of<PartnerCubit>(context).Youtubecontroller,
                              onSaved: (String? value) {},
                              size: 300),
                        ),
                        Expanded(
                          child: buildRowWithTextField(
                              labelText: 'Linkden',
                              controller: BlocProvider.of<PartnerCubit>(context).Linkdencontroller,
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
                          child: buildRowWithTextField(
                              labelText: 'Instgram',
                              controller: BlocProvider.of<PartnerCubit>(context).instgramcontroller,
                              onSaved: (String? value) {},
                              size: 300),
                        ),
                        Expanded(
                          child: buildRowWithTextField(
                              labelText: 'SnapChat',
                              controller: BlocProvider.of<PartnerCubit>(context).SnapChatcontroller,
                              onSaved: (String? value) {},
                              size: 300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    buildRowWithTextField(
                        labelText: 'Whatsap',
                        controller: BlocProvider.of<PartnerCubit>(context).Whatsapcontroller,
                        onSaved: (String? value) {},
                        size: 300),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
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

// Row(
//   children: [
//     Column(
//       children: [
//         Title(title: 'Slug'),
//         SizedBox(height: 24,),
//         Title(title: 'Slug'),
//         SizedBox(height: 24,),
//         Title(title: 'Slug'),
//         SizedBox(height: 24,),
//         Title(title: 'Slug'),
//         SizedBox(height: 24,),
//         Title(title: 'Slug'),
//         Title(title: 'Slug'),
//       ],
//     )
//   ],
// ),
// Row(
//   children: [
//     Column(
//       children: [
//         tabviewWidght(
//           controller: slugcontroller,
//           onSaved: (String? input) {},
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         Row(
//           children: [
//             tabviewWidght(
//               controller: Namecontroller,
//               onSaved: (String? input) {},
//             ),
//             const SizedBox(
//               width: 16,
//             ),
//             tabviewWidght(
//               controller: NmaeinEnglishcontroller,
//               onSaved: (String? input) {},
//             ),
//           ],
//         ),
//         tabviewWidght(
//           controller: Descriptioncontroller,
//           onSaved: (String? input) {},
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         tabviewWidght(
//           controller: DescriptioninEnglishcontroller,
//           onSaved: (String? input) {},
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//       ],
//     ),
//   ],
// ),
