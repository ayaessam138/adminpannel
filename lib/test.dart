import 'package:flutter/material.dart';

class ResizeableTextField extends StatefulWidget {
  @override
  _ResizeableTextFieldState createState() => _ResizeableTextFieldState();
}

class _ResizeableTextFieldState extends State<ResizeableTextField> {
  TextEditingController _textEditingController = TextEditingController();
  double _textFieldWidth = 200.0;
  double _textFieldHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resizable TextField'),
      ),
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              // Update width and height based on user's panning gesture
              _textFieldWidth += details.delta.dx;
              _textFieldHeight += details.delta.dy;
            });
          },
          child: Container(
            width: _textFieldWidth,
            height: _textFieldHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: _textEditingController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Type here...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}