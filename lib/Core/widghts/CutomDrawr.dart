// import 'package:afcoo/Core/ColorManger.dart';
// import 'package:afcoo/Core/Cubits/Layout/nav_bar_cubit.dart';
// import 'package:afcoo/Core/models/SoicalMediaModel.dart';
// import 'package:afcoo/Core/shared_prefrence_value.dart';
// import 'package:afcoo/Core/widghts/Button.dart';
// import 'package:afcoo/More/Persentation/views/ContactUs.dart';
// import 'package:afcoo/Core/widghts/DrwaerItem.dart';
//
// import 'package:afcoo/HomePage/Persentation/views/HomePage.dart';
// import 'package:afcoo/More/Persentation/widghts/MoreContnier.dart';
// import 'package:afcoo/User/Persentation/Views/Login.dart';
// import 'package:afcoo/User/Persentation/Views/Register.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:svg_flutter/svg.dart';
// import 'package:url_launcher/link.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class CustomDrwaer extends StatelessWidget {
//   CustomDrwaer({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Drawer(
//       child: Column(
//         children: [
//           UserImage(),
//           const SizedBox(
//             height: 40,
//           ),
//           CustomButton(
//             title: 'login'.tr(),
//             height: 50,
//             width: 100,
//             textcolor: ColorManger.primaryBlue,
//             backGroundcolor: const Color(0xffEEEEEE),
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(
//                 builder: (context) {
//                   return Login();
//                 },
//               ));
//             },
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           CustomButton(
//             title: 'signup'.tr(),
//             height: 50,
//             width: 100,
//             textcolor: ColorManger.primaryBlue,
//             backGroundcolor: const Color(0xffEEEEEE),
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(
//                 builder: (context) {
//                   return Register();
//                 },
//               ));
//             },
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           SharedPreferenceValue.GetToken() != ''&& SharedPreferenceValue.GetToken!=null
//               ? Column(
//                   children: [
//                     DrawerItem(
//                       color: Color(0xffF7F2F9),
//                       onTap: () {
//                         BlocProvider.of<NavBarCubit>(context)
//                             .changeBottomNavBar(0);
//                       },
//                       asset: 'assets/svgs/icon-home-active.svg',
//                       Title: 'home'.tr(),
//                     ),
//
//                     const Divider(
//                       height: 1.5,
//                       color: Colors.black,
//                     ),
//                     DrawerItem(
//                       color: Color(0xffF7F2F9),
//                       onTap: () {
//                         BlocProvider.of<NavBarCubit>(context)
//                             .changeBottomNavBar(1);
//                       },
//                       asset: 'assets/svgs/icon-document.svg',
//                       Title: 'offers'.tr(),
//                     ),
//                     const Divider(height: 1.5, color: Colors.black),
//                     DrawerItem(
//                       color: Color(0xffF7F2F9),
//                       onTap: () {
//                         BlocProvider.of<NavBarCubit>(context)
//                             .changeBottomNavBar(2);
//                       },
//                       asset: 'assets/svgs/icon-badge-active.svg',
//                       Title: 'subscriptions'.tr(),
//                     ),
//                     const Divider(height: 1.5, color: Colors.black),
//                     DrawerItem(
//                       color: Color(0xffF7F2F9),
//                       onTap: () {
//                         BlocProvider.of<NavBarCubit>(context)
//                             .changeBottomNavBar(3);
//                       },
//                       asset: 'assets/svgs/icon-more.svg',
//                       Title: 'more'.tr(),
//                     ),
//                     const Divider(height: 1.5, color: Colors.black),
//                     DrawerItem(
//                       color: Color(0xffF7F2F9),
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) {
//                             return ContactUs();
//                           },
//                         ));
//                       },
//                       asset: 'assets/svgs/icon-call.svg',
//                       Title: 'contactus'.tr(),
//                     ),
//                     // Spacer(),
//                     const Divider(height: 1.5, color: Colors.black),
//                     DrawerItem(
//                       color: Color(0xffF7F2F9),
//                       onTap: () {
//                         SharedPreferenceValue.Removeemail();
//                         SharedPreferenceValue.Removepassword();
//                         SharedPreferenceValue.RemoveRemberme();
//                         SharedPreferenceValue.RemoveToken();
//                         Navigator.pushReplacement(context, MaterialPageRoute(
//                           builder: (context) {
//                             return Login();
//                           },
//                         ));
//                       },
//                       asset: 'assets/svgs/icon-logout.svg',
//                       Title: 'Logout'.tr(),
//                     ),
//                     // const Divider(height: 1.5, color: Colors.black),
//                   ],
//                 )
//               : Column(
//                   children: [
//                     DrawerItem(
//                       color: Color(0xffF7F2F9),
//                       onTap: () {
//                         BlocProvider.of<NavBarCubit>(context)
//                             .changeBottomNavBar(0);
//                       },
//                       asset: 'assets/svgs/icon-home-active.svg',
//                       Title: 'home'.tr(),
//                     ),
//
//                     const Divider(
//                       height: 1.5,
//                       color: Colors.black,
//                     ),
//                     DrawerItem(
//                       color: Color(0xffF7F2F9),
//                       onTap: () {
//                         BlocProvider.of<NavBarCubit>(context)
//                             .changeBottomNavBar(1);
//                       },
//                       asset: 'assets/svgs/icon-document.svg',
//                       Title: 'offers'.tr(),
//                     ),
//                     const Divider(height: 1.5, color: Colors.black),
//                     DrawerItem(
//                       color: Color(0xffF7F2F9),
//                       onTap: () {
//                         BlocProvider.of<NavBarCubit>(context)
//                             .changeBottomNavBar(2);
//                       },
//                       asset: 'assets/svgs/icon-more.svg',
//                       Title: 'more'.tr(),
//                     ),
//                     const Divider(height: 1.5, color: Colors.black),
//                     DrawerItem(
//                       color: Color(0xffF7F2F9),
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) {
//                             return ContactUs();
//                           },
//                         ));
//                       },
//                       asset: 'assets/svgs/icon-call.svg',
//                       Title: 'contactus'.tr(),
//                     ),
//
//                   ],
//                 ),
//           Spacer(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     launchUrl(
//                         Uri.parse(BlocProvider.of<NavBarCubit>(context)
//                                 .soicalMediaModel
//                                 ?.snapchat ??
//                             ''),
//                         mode: LaunchMode.externalApplication);
//                     BlocProvider.of<NavBarCubit>(context).ChangeState();
//                   },
//                   icon: SvgPicture.asset(
//                     'assets/svgs/snspchat.svg',
//                   )),
//               IconButton(
//                   onPressed: () {
//                     launchUrl(
//                         Uri.parse(BlocProvider.of<NavBarCubit>(context)
//                                 .soicalMediaModel
//                                 ?.twitter ??
//                             ''),
//                         mode: LaunchMode.externalApplication);
//                     BlocProvider.of<NavBarCubit>(context).ChangeState();
//                   },
//                   icon: SvgPicture.asset(
//                     'assets/svgs/twitter.svg',
//                   )),
//               IconButton(
//                   onPressed: () {
//                     launchUrl(
//                         Uri.parse(BlocProvider.of<NavBarCubit>(context)
//                                 .soicalMediaModel
//                                 ?.facebook ??
//                             ''),
//                         mode: LaunchMode.externalApplication);
//                     BlocProvider.of<NavBarCubit>(context).ChangeState();
//                   },
//                   icon: SvgPicture.asset(
//                     'assets/svgs/facebook.svg',
//                   )),
//               IconButton(
//                   onPressed: () {
//                     launchUrl(
//                         Uri.parse(BlocProvider.of<NavBarCubit>(context)
//                                 .soicalMediaModel
//                                 ?.linkedin ??
//                             ''),
//                         mode: LaunchMode.externalApplication);
//                     BlocProvider.of<NavBarCubit>(context).ChangeState();
//                   },
//                   icon: SvgPicture.asset(
//                     'assets/svgs/linkedin.svg',
//                   )),
//               IconButton(
//                   onPressed: () {
//                     launchUrl(
//                         Uri.parse(BlocProvider.of<NavBarCubit>(context)
//                                 .soicalMediaModel
//                                 ?.instagram ??
//                             ''),
//                         mode: LaunchMode.externalApplication);
//                     BlocProvider.of<NavBarCubit>(context).ChangeState();
//                   },
//                   icon: SvgPicture.asset(
//                     'assets/svgs/instagram.svg',
//                   )),
//               IconButton(
//                   onPressed: () async {
//                     String phoneNumber = soicalMediaModel?.whatsapp ?? '';
//                     var whatsAppUrl = Uri.parse(
//                       "https://wa.me/$phoneNumber",
//                     );
//                     await launchUrl(whatsAppUrl,
//                         mode: LaunchMode.externalApplication);
//                     BlocProvider.of<NavBarCubit>(context).ChangeState();
//                   },
//                   icon: SvgPicture.asset(
//                     'assets/svgs/whatssapp.svg',
//                   )),
//             ],
//           )
//
//         ],
//       ),
//     );
//   }
// }
//
// // , SizedBox(
// //    height: 50,
// //    child: BlocBuilder<NavBarCubit, NavBarState>(
// //      builder: (context, state) {
// //        var Cubit=BlocProvider.of<NavBarCubit>(context);
// //        return ListView.builder(
// //          itemCount:6 ,
// //          scrollDirection: Axis.horizontal,
// //          shrinkWrap: true,
// //          itemBuilder: (context, index) {
// //            return SizedBox(
// //                height: 200,
// //                width: 50,
// //                child: IconButton(
// //                    onPressed: (){}, icon:
// //                SvgPicture.asset(
// //                  'assets/svgs/icon-profile.svg',)));
// //          },);
// //      },
// //    ),
// //  )
// class UserImage extends StatelessWidget {
//   const UserImage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Container(
//         height: MediaQuery.of(context).size.height * .2,
//         color: ColorManger.primaryBlue,
//       ),
//       Positioned(
//           top: 70,
//           right: 90,
//           child: SvgPicture.asset('assets/svgs/pic-user.svg'))
//     ]);
//   }
// }
