import 'package:flutter/material.dart';

class TabTitle extends StatelessWidget {
  const TabTitle({
    super.key, required this.Title,
  });
  final String Title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Container(
            width: 250,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(

                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),

                  ),
                  color: Color(0xff3C8DBC)),
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Title,
                  style: const TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}