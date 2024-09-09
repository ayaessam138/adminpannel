import 'package:afcooadminpanel/Core/functions.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabTitle.dart';
import 'package:afcooadminpanel/Core/widghts/TabFooter.dart';
import 'package:afcooadminpanel/Partner/partners/PartnerCubit/partner_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class seo extends StatelessWidget {
  seo({super.key});
  // TextEditingController keywordscontroller = TextEditingController();
  // TextEditingController Metadescriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const TabTitle(
            Title: 'Seo',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: Container(
                // height: MediaQuery.of(context).size.height * .60,
                decoration: const BoxDecoration(color: Color(0xffFBF9F4)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: buildRowWithTextField(
                          labelText: 'Key words',
                          controller: BlocProvider.of<PartnerCubit>(context).keywordscontroller,
                          onSaved: (String? value) {},
                          size: 600,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: buildRowWithWidght(
                          labelText: '',
                          width: 800,
                          widget: const Text(
                            'Keywords help you manage how this topic appears on search engines. For more information, click here',
                            style:
                                TextStyle(color: Color(0xffA2A2A1), fontSize: 12),
                          ),
                        ),
                      ),
                      buildRowWithTextField(
                          labelText: 'Meta description',
                          controller: BlocProvider.of<PartnerCubit>(context).Metadescriptioncontroller,
                          onSaved: (String? value) {},
                          size: 600,
                          Maxlines: 3),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: buildRowWithWidght(
                          labelText: '',
                          width: 800,
                          widget: const Text(
                            'Meta description helps you manage how this topic appears on search engines. For more information, click here',
                            style:
                                TextStyle(color: Color(0xffA2A2A1), fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
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
