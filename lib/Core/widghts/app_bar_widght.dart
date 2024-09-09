import 'package:afcooadminpanel/Core/widghts/SearchBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  TextEditingController Search = TextEditingController();
  @override
  Size get preferredSize =>
      const Size.fromHeight(56.0); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff3C8DBC),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const Text('Afco Care', style: TextStyle(color: Colors.white)),
        ),
        const Spacer(),
        SearchBarwidght(
          SearchController: Search,
        ),
        TextButton(onPressed: () {}, child: const Text('English')),
        const SizedBox(
          width: 8,
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert)),
        const SizedBox(
          width: 8,
        ),

        const CircleAvatar(),
        const SizedBox(
          width: 8,
        ),


      ],
    );
  }
}
