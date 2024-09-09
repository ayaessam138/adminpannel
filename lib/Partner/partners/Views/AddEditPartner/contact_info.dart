import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/TabTitle.dart';
import 'package:afcooadminpanel/Core/widghts/TabFooter.dart';
import 'package:afcooadminpanel/Partner/partners/PartnerCubit/partner_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Contactinfo extends StatelessWidget {
  Contactinfo({super.key});
  // TextEditingController adresscontroller = TextEditingController();
  // TextEditingController adressinEnglishcontroller = TextEditingController();
  // TextEditingController mobilecontroller = TextEditingController();
  // TextEditingController telphonecontroller = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController searchPlace = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const TabTitle(Title: 'Contact Info'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: Container(
                // height: MediaQuery.of(context).size.height * .90,
                decoration: const BoxDecoration(color: Color(0xffFBF9F4)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [

                      Expanded(
                        child: buildRowWithTextField(
                          labelText: 'Adress',
                          controller: BlocProvider.of<PartnerCubit>(context).adresscontroller,
                          onSaved: (String? value) {},
                          size: 600,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: buildRowWithTextField(
                          labelText: 'Adress in English ',
                          controller: BlocProvider.of<PartnerCubit>(context).adressinEnglishcontroller,
                          onSaved: (String? value) {},
                          size: 600,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: buildRowWithTextField(
                                labelText: 'Mobile',
                                controller: BlocProvider.of<PartnerCubit>(context).mobilecontroller,
                                onSaved: (String? value) {},
                                size: 300),
                          ),
                          Expanded(
                            child: buildRowWithTextField(
                                labelText: 'Telphone',
                                controller: BlocProvider.of<PartnerCubit>(context).telphonecontroller,
                                onSaved: (String? value) {},
                                size: 300),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: buildRowWithTextField(
                            labelText: 'Email',
                            controller: BlocProvider.of<PartnerCubit>(context).emailController,
                            onSaved: (String? value) {},
                            size: 300),
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          // const TabTitle(Title: 'Google Maps'),
          // Expanded(
          //   child: Padding(
          //     padding:  EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          //     child: Container(
          //         height: MediaQuery.of(context).size.height * .90,
          //         decoration:
          //         const BoxDecoration(color: Color(0xffFBF9F4)),
          //         child: Padding(
          //           padding: const EdgeInsets.all(6.0),
          //           child: Column(
          //
          //             children: [
          //               Expanded(
          //                 child: buildRowWithTextField(
          //                   labelText: 'Search',
          //                   controller: BlocProvider.of<PartnerCubit>(context).sea,
          //                   onSaved: (String? value) {},
          //                   size: 600,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         )),
          //   ),
          // ),
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
