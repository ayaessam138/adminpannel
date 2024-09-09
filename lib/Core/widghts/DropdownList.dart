
import 'package:flutter/material.dart';

class FilterDropdownList<T> extends StatelessWidget {
  FilterDropdownList(
      {super.key,
        required this.Options,
        required this.Hint,
        required this.onChanged,
        this.selectedvalue,
        this.Ontap});

  List<DropdownMenuItem<T>> Options;
  final String Hint;
  final T? selectedvalue;

  final void Function(T?) onChanged;
  void Function()? Ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1.5, color: const Color(0xffDEDEDE))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          onTap: Ontap,
          value: selectedvalue,
          hint: Text(
            Hint,
            style: const TextStyle(color: Color(0xffABADB9)),
          ),
          // underline: Container(height: 40,),
          isExpanded: true,

          items: Options,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

