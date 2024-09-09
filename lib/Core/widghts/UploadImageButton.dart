import 'package:flutter/material.dart';

class UpladImageButton extends StatelessWidget {
  const UpladImageButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        // height: 150,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(8.0), // Border radius
          side: BorderSide(color: Color(0xffD2D6DE)), // Border color
        ),
        onPressed: onPressed,
        // height: 150,
        child: Row(
          children: [
            const Text(
              'Uplaod Image',
              style: TextStyle(color: Color(0xff999999)),
            ),
            const SizedBox(
              width: 4,
            ),
            Image.asset('assets/images/upload.png')
          ],
        ));
  }
}
