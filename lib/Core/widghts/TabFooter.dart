import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:flutter/material.dart';

class TabFooter extends StatelessWidget {
  const TabFooter({
    super.key,
    this.onTap, required this.Title
  });
final void Function()? onTap;
final String Title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            onTap: onTap,
            title: Title,
            height:
            MediaQuery.of(context).size.height *
                .06,
            width:
            MediaQuery.of(context).size.width *
                .07,
            textcolor: Colors.white,
            backGroundcolor: const Color(0xff3E7D7A),
          ),
        ),
      ],
    );
  }
}
