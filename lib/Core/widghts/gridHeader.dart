import 'package:flutter/material.dart';

class GridHeader extends StatelessWidget {
  GridHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(


        decoration: const BoxDecoration(color: Color(0xff3C8DBC)),
        padding: const EdgeInsets.all(8),
        alignment: Alignment.bottomCenter,
        child: FittedBox(
          child: Text(
            title,
            overflow: TextOverflow.clip,
            softWrap: true,
            style: const TextStyle(color: Color(0xffFFFFFF)),
          ),
        ));
  }
}