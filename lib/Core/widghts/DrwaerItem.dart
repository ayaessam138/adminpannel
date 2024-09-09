
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.onTap,
    required this.asset,
    required this.Title,
    this.color
  });
  final void Function() onTap;
  final String asset;
  final String Title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .05,
        // width: do,
        color:color,
        // color:const Color(0xffF7F2F9),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                asset,
                color: Colors.black,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                Title,
                style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: 'SST Arabic'),
              )
            ],
          ),
        ),
      ),
    );
  }
}