import 'package:afcooadminpanel/Cards/card/cardModel.dart';
import 'package:afcooadminpanel/Cards/card/card_cubit.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/tableRowWidght.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowCardDetails extends StatelessWidget {
  final CardModel CardbyIdModel;
  List<String> keysList = [
    "id",
    "name",
    "name_en",
    "code",
    "image",
    "cardImage",
    "status"
  ];

  ShowCardDetails({super.key, required this.CardbyIdModel});
  String getValueForKey(String key) {
    switch (key) {
      case "id":
        return CardbyIdModel.id.toString();
      case "name":
        return CardbyIdModel.name;
      case "name_en":
        return CardbyIdModel.nameEn;
      case "code":
        return CardbyIdModel.code.toString();
      case "image":
        return CardbyIdModel.image;
      case "cardImage":
        return CardbyIdModel.cardImage;
        case "status":
        return CardbyIdModel.status.toString();

      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F5),
      body: BlocBuilder<CardCubit, CardState>(
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