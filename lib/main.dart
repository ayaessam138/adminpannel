import 'package:afcooadminpanel/Banners/banners_cubit.dart';
import 'package:afcooadminpanel/Cards/card/card_cubit.dart';
import 'package:afcooadminpanel/Cards/discountCode/discount_code_cubit.dart';
import 'package:afcooadminpanel/ContactUs/contact_us_cubit.dart';
import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/BlocObsever.dart';
import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/layout/layout_cubit.dart';
import 'package:afcooadminpanel/Customers/customers_cubit.dart';
import 'package:afcooadminpanel/EmailMeesages/emailMenu/email_menu_cubit.dart';
import 'package:afcooadminpanel/EmailMeesages/emaillistgroups/email_list_grpoup_cubit.dart';
import 'package:afcooadminpanel/Features/features_cubit.dart';
import 'package:afcooadminpanel/Mangers/mangers_cubit.dart';
import 'package:afcooadminpanel/Partner/Branches/branches_cubit.dart';

import 'package:afcooadminpanel/Partner/offers/offers_cubit.dart';
import 'package:afcooadminpanel/Partner/partners/PartnerCubit/partner_cubit.dart';
import 'package:afcooadminpanel/Sliders/sliders_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/Messagetemplates/messagetemplates_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/Nationality/nationnality_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/cardfield/card_field_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/cities/cities_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/region_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/websiteContentMangement/website_content_mangement_cubit.dart';
import 'package:afcooadminpanel/commnQuestions/commn_questions_cubit.dart';
import 'package:afcooadminpanel/jionUs/jion_us_cubit.dart';
import 'package:afcooadminpanel/pages/pages_cubit.dart';
import 'package:afcooadminpanel/service/service_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => RegionCubit()..GetallRegions()),
        BlocProvider(
          create: (context) => PartnerCubit()..GetallPartners(),
        ),
        BlocProvider(create: (context) => CitiesCubit()..GetallCities()),
        BlocProvider(create: (context) => CardFieldCubit()..GetallCardFields()),
        BlocProvider(create: (context) => ServiceCubit()..GetallService()),
        BlocProvider(
          create: (context) => DiscountCodeCubit()..GetallDisCountCode(),
        ),
        BlocProvider(
          create: (context) => OffersCubit()..GetallOffers(),
        ),
        BlocProvider(create: (context) => CardCubit()..GetallCard()),
        BlocProvider(create: (context) => WebsiteContentMangementCubit()),
        BlocProvider(create: (context) => NationnalityCubit()),
        BlocProvider(create: (context) => MessagetemplatesCubit()),
        BlocProvider(create: (context) => EmailMenuCubit()),
        BlocProvider(create: (context) => EmailListGrpoupCubit()),
        BlocProvider(create: (context) => BranchesCubit()),
        BlocProvider(create: (context) => CustomersCubit()),
        BlocProvider(create: (context) => ContactUsCubit()),
        BlocProvider(create: (context) => JionUsCubit()),
        BlocProvider(create: (context) => SlidersCubit()),
        BlocProvider(create: (context) => BannersCubit()),
        BlocProvider(create: (context) => CommnQuestionsCubit()),
        BlocProvider(create: (context) => FeaturesCubit()),
        BlocProvider(create: (context) => PagesCubit()),
        BlocProvider(create: (context) => MangersCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
      ),
    );
  }
}
