import 'package:flutter/material.dart';

class LayoutFotter extends StatelessWidget {
  const LayoutFotter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(

          width: MediaQuery.of(context).size.width * .79,

          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Afco Cards',
                  style: TextStyle(color: Color(0xff72AFD2)),
                ),
                SizedBox(width: 12,),
                Text(
                  'All rights are saved',
                  style: TextStyle(color: Color(0xff757575)),
                ),
                Spacer(),
                Text(
                  'Copyright 2024',
                  style: TextStyle(color: Color(0xff757575)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}