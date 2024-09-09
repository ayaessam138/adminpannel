import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/layout/layout_cubit.dart';
import 'package:afcooadminpanel/Core/widghts/LayoutFotter.dart';
import 'package:afcooadminpanel/Core/widghts/app_bar_widght.dart';
import 'package:afcooadminpanel/Partner/partners/Views/Partners_screen.dart';
import 'package:afcooadminpanel/Partner/partners/Views/test.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Layout extends StatelessWidget {
// initialize a index
  int index = 0;
  List<Widget> Screens = [ PartnersScreen(), const test(), const test()];
// final StatefulNavigationShell navigationShell;

   Layout({super.key, });
  // void _onItemTapped(int index) {
  //
  //     _selectedIndex = index;
  //
  // }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar(),
          body:
          Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    AnimatedContainer(
                      decoration: const BoxDecoration(color: Color(0xffF9FAFC)),
                      width: MediaQuery.of(context).size.width * .14,
                      duration: const Duration(seconds: 1),
                      child: Column(
                        children: [
                          ExpansionTile(
                            title: const ListTile(
                              title: Text('Partners',style: TextStyle(color: Color(0xff444444)),),
                            ),
                            children: [
                              ListTile(
                                 leading:Image.asset('assets/images/Vector.png'),
                                title: const Text('Partners',style: TextStyle(color: Color(0xff444444)),),
                                onTap: () {
                                  BlocProvider.of<LayoutCubit>(context).Navigation(index: 0);
                                  // GoRouter.of(context).go('/editPartnerPath');
                                },
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: const ListTile(
                              title: Text('Item 1'),
                            ),
                            children: [
                              ListTile(
                                title: const Text('Item 1'),
                                onTap: () {
                                  BlocProvider.of<LayoutCubit>(context).Navigation(index: 1);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child:
                        Screens[BlocProvider.of<LayoutCubit>(context)
                            .currentIndex]
                    ),
                  ],
                ),
              ),
              LayoutFotter()
            ],
          ),
        );
      },
    );
  }
}



// NavigationRail(
//   minWidth: 100,
//   selectedIndex:
//       BlocProvider.of<LayoutCubit>(context).currentIndex,
//   onDestinationSelected: (int index) {
//     BlocProvider.of<LayoutCubit>(context)
//         .Navigation(index: index);
//   },
//   labelType: NavigationRailLabelType.selected
//   ,
//   backgroundColor: Color(0xffF9FAFC),
//   destinations: const <NavigationRailDestination>[
//     // navigation destinations
//     NavigationRailDestination(
//       icon: SizedBox(
//           width: 300,
//           child: ExpansionTile(
//             title: Text(''),
//             children: [],
//           )),
//       label: Text('Wishlist'),
//     ),
//     NavigationRailDestination(
//       icon: Icon(Icons.person_outline_rounded),
//       selectedIcon: Icon(Icons.person),
//       label: Text('Account'),
//     ),
//     NavigationRailDestination(
//       icon: Icon(Icons.shopping_cart_outlined),
//       selectedIcon: Icon(Icons.shopping_cart),
//       label: Text('Cart'),
//     ),
//   ],
//   selectedIconTheme: IconThemeData(color: Colors.white),
//   unselectedIconTheme: IconThemeData(color: Colors.black),
//   selectedLabelTextStyle: TextStyle(color: Colors.white),
// ),
