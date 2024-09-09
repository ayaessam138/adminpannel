import 'package:flutter/material.dart';

class RadioListTilewidghtinColumn extends StatelessWidget {
  const RadioListTilewidghtinColumn(
      {super.key, required this.selectedOption, required this.onChanged});
  final String selectedOption;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: RadioListTile(
              title: const Text('Posted'),
              value: 'Posted',
              groupValue: selectedOption,
              onChanged: onChanged),
        ),
        Expanded(
          child: RadioListTile(
              title: const Text('NotPosted'),
              value: 'NotPosted',
              groupValue: selectedOption,
              onChanged: onChanged),
        ),
      ],
    );
  }
}

class RadioListTilewidghtinRowPosted extends StatelessWidget {
  const RadioListTilewidghtinRowPosted(
      {super.key, required this.selectedOption, required this.onChanged});
  final String selectedOption;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RadioListTile(
              title: const Text('Posted'),
              value: 'Posted',
              groupValue: selectedOption,
              onChanged: onChanged),
        ),
        Expanded(
          child: RadioListTile(
              title: const Text('NotPosted'),
              value: 'NotPosted',
              groupValue: selectedOption,
              onChanged: onChanged),
        ),
      ],
    );
  }
}

class RadioListTilewidghtinRowYes extends StatelessWidget {
  const RadioListTilewidghtinRowYes(
      {super.key, required this.selectedOption, required this.onChanged});
  final String selectedOption;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RadioListTile(
              title: const Text('Yes'),
              value: 'Yes',
              groupValue: selectedOption,
              onChanged: onChanged),
        ),
        Expanded(
          child: RadioListTile(
              title: const Text('No'),
              value: 'No',
              groupValue: selectedOption,
              onChanged: onChanged),
        ),
      ],
    );
  }
}

class RadioListTilewidghtinRowGenral extends StatelessWidget {
  const RadioListTilewidghtinRowGenral(
      {super.key,
      required this.selectedOption,
      required this.onChanged,
      required this.title1,
      required this.value1,
      required this.title2,
      required this.value2});
  final String selectedOption;
  final String title1;
  final String value1;
  final String title2;
  final String value2;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RadioListTile(
              title: Text(title1),
              value: value1,
              groupValue: selectedOption,
              onChanged: onChanged),
        ),
        Expanded(
          child: RadioListTile(
              title: Text(title2),
              value: value2,
              groupValue: selectedOption,
              onChanged: onChanged),
        ),
      ],
    );
  }
}
