import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class TableRowWidget extends StatelessWidget {
  final String cell1Text;
  final String cell2Text;
  final Color color;

  TableRowWidget(
      {required this.cell1Text, required this.cell2Text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: const Color(0xffF4F4F4), // Change the border color
        // Change the border width
      ),
      columnWidths: {
        0: FixedColumnWidth(MediaQuery.of(context).size.width *
            .20), // Width for the first column
        1: FixedColumnWidth(MediaQuery.of(context).size.width * .80)
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: color,
          ),
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cell1Text,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: cell2Text.contains('http://192.168.1.250')?Image.network(cell2Text,width: 300,height: 300,errorBuilder: (context, error, stackTrace) {
                  return SvgPicture.asset('assets/images/image_placeholder.svg');
                },):Text(cell2Text),
              ),
            ),
          ],
        ),
      ],
    );
  }
}