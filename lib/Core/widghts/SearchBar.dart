import 'package:flutter/material.dart';

class SearchBarwidght extends StatelessWidget {
  SearchBarwidght({super.key, required this.SearchController, this.onChanged});
  final TextEditingController SearchController;
  // final void Function() onPressed;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .30,
      height: MediaQuery.sizeOf(context).height * .07,
      decoration: BoxDecoration(
          color: Color(0xffECEEF1), borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),

            hintText: 'search',
            hintStyle: TextStyle(
              color: Color(0xff7099D7).withOpacity(0.6),

            ),
          ),
          controller: SearchController,
        ),
      ),
    );
  }
}
