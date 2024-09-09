import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TableRowWidght.dart';
import 'package:afcooadminpanel/WebsiteMangement/cardfield/card_field_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/cardfield/cardfieldModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowCardFieldDeatils extends StatelessWidget {
  final CardFieldModel Cardfield;
  List<String> KeysList = [
    "id",
    "title",
    "title_en",
    "image",
    "sort_at",
    "status",
    "content",
    "content_en"
  ];
  String getValueForKey(String key) {
    switch (key) {
      case "id":
        return Cardfield.id.toString();
      case "title":
        return Cardfield.title ;
      case "title_en":
        return Cardfield.titleEn ;
      case "image":
        return Cardfield.image;
      case "sort_at":
        return Cardfield.sortAt.toString();
      case "status":
        return Cardfield.status.toString();
      case "content":
        return Cardfield.content;
      case "content_en":
        return Cardfield.contentEn;

      default:
        return "";
    }
  }

  ShowCardFieldDeatils({super.key, required this.Cardfield});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: const Color(0xffECF0F5),
 body: BlocBuilder<CardFieldCubit, CardFieldState>(
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
                            itemCount: KeysList.length, // Number of rows
                            itemBuilder: (context, index) {
                              String key = KeysList[index];
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
