import 'package:flutter/material.dart';

class TabHeader extends StatelessWidget {
  const TabHeader({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8, bottom: 16, top: 8),
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ],
    );
  }
}