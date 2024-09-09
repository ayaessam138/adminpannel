import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Partner/partners/PartnerCubit/partner_cubit.dart';
import 'package:afcooadminpanel/Partner/partners/Views/AddEditPartner/Services.dart';
import 'package:afcooadminpanel/Partner/partners/Views/AddEditPartner/Soicalmedia.dart';
import 'package:afcooadminpanel/Partner/partners/Views/AddEditPartner/contact_info.dart';
import 'package:afcooadminpanel/Partner/partners/Views/AddEditPartner/seo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'about_partnter.dart';
class AddEditPartnner extends StatelessWidget {
  const AddEditPartnner({super.key, required this.isAdd});
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    Utility.myPrintX('');
    Utility.myPrintX(isAdd);
    return Scaffold(
      body: BlocBuilder<PartnerCubit, PartnerState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 5,
            child: Scaffold(
              backgroundColor: const Color(0xffECF0F5),
              body: Column(
                children: [
                  TabHeader(title: isAdd ? 'Add' : 'Edit'),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              top: BorderSide(
                                  width: 3, color: Color(0xff3C8DBC)))),
                      child: Column(
                        children: [
                          const TabBar(
                            tabs: [
                              Tab(icon: Text('About Partner')),
                              Tab(icon: Text('Services')),
                              Tab(icon: Text('Soical Media')),
                              Tab(icon: Text('Contact Info')),
                              Tab(icon: Text('SEO')),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: SizedBox(
                                height: MediaQuery.of(context)
                                    .size
                                    .height, // Provide a fixed height
                                child: TabBarView(children: [
                                  AboutPartner(),
                                  Services(),
                                  SoicalMedia(),
                                  Contactinfo(),
                                  seo(),
                                ]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
