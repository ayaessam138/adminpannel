import 'dart:js';

import 'package:afcooadminpanel/Banners/Banners_Screen.dart';
import 'package:afcooadminpanel/Banners/add_Banners.dart';
import 'package:afcooadminpanel/Banners/banners_cubit.dart';
import 'package:afcooadminpanel/Banners/showBannersDeatils.dart';
import 'package:afcooadminpanel/Cards/card/card_Screen.dart';
import 'package:afcooadminpanel/Cards/card/card_cubit.dart';
import 'package:afcooadminpanel/Cards/card/showCardDeatils.dart';
import 'package:afcooadminpanel/Cards/discountCode/AddDisCountCode.dart';
import 'package:afcooadminpanel/Cards/discountCode/discountCode_Screen.dart';
import 'package:afcooadminpanel/Cards/discountCode/discount_code_cubit.dart';
import 'package:afcooadminpanel/Cards/discountCode/showDiscountCodeDeatils.dart';
import 'package:afcooadminpanel/ContactUs/ContactUs_Screen.dart';
import 'package:afcooadminpanel/ContactUs/contact_us_cubit.dart';
import 'package:afcooadminpanel/ContactUs/showContactUsDeatils.dart';
import 'package:afcooadminpanel/Core/widghts/LayoutFotter.dart';
import 'package:afcooadminpanel/Core/widghts/app_bar_widght.dart';
import 'package:afcooadminpanel/Customers/customers_Screen.dart';
import 'package:afcooadminpanel/Customers/customers_cubit.dart';
import 'package:afcooadminpanel/Customers/showCustomerDeatils.dart';
import 'package:afcooadminpanel/EmailMeesages/emailMenu/EmailMenu_screen.dart';
import 'package:afcooadminpanel/EmailMeesages/emailMenu/addEmailMenu.dart';
import 'package:afcooadminpanel/EmailMeesages/emailMenu/email_menu_cubit.dart';
import 'package:afcooadminpanel/EmailMeesages/emailMenu/showEmailMenuDeatils.dart';
import 'package:afcooadminpanel/EmailMeesages/emaillistgroups/EmailListGrpoup_Screen.dart';
import 'package:afcooadminpanel/EmailMeesages/emaillistgroups/addEmailGroup.dart';
import 'package:afcooadminpanel/EmailMeesages/emaillistgroups/email_list_grpoup_cubit.dart';
import 'package:afcooadminpanel/EmailMeesages/emaillistgroups/showEmailListGroupDeatils.dart';
import 'package:afcooadminpanel/Features/Features_Screen.dart';
import 'package:afcooadminpanel/Features/addFeatuers.dart';
import 'package:afcooadminpanel/Features/features_cubit.dart';
import 'package:afcooadminpanel/Features/showFeatureDeatils.dart';
import 'package:afcooadminpanel/Mangers/addManger.dart';
import 'package:afcooadminpanel/Mangers/mangers_Screen.dart';
import 'package:afcooadminpanel/Mangers/mangers_cubit.dart';
import 'package:afcooadminpanel/Mangers/showMangerDeatils.dart';
import 'package:afcooadminpanel/Partner/Branches/ShowBranchesDeatils.dart';
import 'package:afcooadminpanel/Partner/Branches/branches_cubit.dart';
import 'package:afcooadminpanel/Partner/Branches/branches_screen.dart';

import 'package:afcooadminpanel/Partner/offers/addoffer.dart';
import 'package:afcooadminpanel/Partner/offers/offers_Screen.dart';
import 'package:afcooadminpanel/Partner/offers/offers_cubit.dart';
import 'package:afcooadminpanel/Partner/offers/show_offer_Deatils.dart';
import 'package:afcooadminpanel/Partner/partners/PartnerCubit/partner_cubit.dart';
import 'package:afcooadminpanel/Partner/partners/Views/AddEditPartner/Add_edit_partner.dart';

import 'package:afcooadminpanel/Partner/partners/Views/Partners_screen.dart';
import 'package:afcooadminpanel/Partner/partners/Views/ShowPartnerDeatils.dart';
import 'package:afcooadminpanel/Sliders/Addslider.dart';
import 'package:afcooadminpanel/Sliders/showSliderDeatils.dart';
import 'package:afcooadminpanel/Sliders/slider_screen.dart';
import 'package:afcooadminpanel/Sliders/sliders_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/Messagetemplates/messageTemplate_Screen.dart';
import 'package:afcooadminpanel/WebsiteMangement/Messagetemplates/messagetemplates_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/Messagetemplates/showmessageTemplateDetails.dart';
import 'package:afcooadminpanel/WebsiteMangement/Nationality/addNationailty.dart';
import 'package:afcooadminpanel/WebsiteMangement/Nationality/nationailty_screen.dart';
import 'package:afcooadminpanel/WebsiteMangement/Nationality/nationnality_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/Nationality/showNationailtyDeatils.dart';
import 'package:afcooadminpanel/WebsiteMangement/cardfield/AddCardField.dart';
import 'package:afcooadminpanel/WebsiteMangement/cardfield/Show_CardField_Deatils.dart';
import 'package:afcooadminpanel/WebsiteMangement/cardfield/card_field_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/cardfield/cardfield_screen.dart';
import 'package:afcooadminpanel/WebsiteMangement/cities/AddCity.dart';
import 'package:afcooadminpanel/WebsiteMangement/cities/CitiesScreen.dart';
import 'package:afcooadminpanel/WebsiteMangement/cities/cities_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/cities/cityModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/cities/show_City_Deatils.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/addRegion.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/regionModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/regionScreen.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/region_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/showregion_Deatils.dart';
import 'package:afcooadminpanel/WebsiteMangement/websiteContentMangement/editWebSiteContentMangeMent.dart';
import 'package:afcooadminpanel/WebsiteMangement/websiteContentMangement/showWebsiteContentMangementDeatils.dart';
import 'package:afcooadminpanel/WebsiteMangement/websiteContentMangement/websiteContentMangement_Screen.dart';
import 'package:afcooadminpanel/WebsiteMangement/websiteContentMangement/website_content_mangement_cubit.dart';
import 'package:afcooadminpanel/commnQuestions/addCommnQuestions.dart';
import 'package:afcooadminpanel/commnQuestions/commnQuestions_Screem.dart';
import 'package:afcooadminpanel/commnQuestions/commn_questions_cubit.dart';
import 'package:afcooadminpanel/commnQuestions/showCommnQuestionsDeatils.dart';
import 'package:afcooadminpanel/jionUs/jionUs_Screen.dart';
import 'package:afcooadminpanel/jionUs/jion_us_cubit.dart';
import 'package:afcooadminpanel/jionUs/showJionUsDeatils.dart';
import 'package:afcooadminpanel/pages/Pages_Scteen.dart';
import 'package:afcooadminpanel/pages/addPage.dart';
import 'package:afcooadminpanel/pages/pages_cubit.dart';
import 'package:afcooadminpanel/pages/showPagesDeatils.dart';
import 'package:afcooadminpanel/service/addService.dart';
import 'package:afcooadminpanel/service/service_cubit.dart';
import 'package:afcooadminpanel/service/service_screen.dart';
import 'package:afcooadminpanel/service/show_Service_Deatils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NamedPath {
  static String initialLocation = '/Cardfield';
  static String WebsiteContentMangementRoute = '/WebsiteContentMangement';
  static String RegionRoute = '/regions';
  static String CitiesRoute = '/CitiesRoute';
  static String NationailtyRoute = '/NationailtyRoute';
  static String MessageteplateRoute = '/Messageteplate';
  static String EmailMenuRoute = '/EmailMenuRoute';
  static String EmailListGroupRoute = '/EmailListGroupRoute';
  static String partnerroute = '/partnerroute';
  static String Branchesroute = '/Branchesroute';
  static String offersroute = '/offersroute';
  static String Customersoute = '/Customersoute';
  static String Cardroute = '/Cardroute';
  static String DisCountCoderoute = '/DisCountCoderoute';
  static String Serviceroute = '/Serviceroute';
  static String Contactusroute = '/Contactusroute';
  static String JionUsroute = '/JionUsroute';
  static String SLidersroute = '/SLidersroute';
  static String Bannersroute = '/Bannersroute';
  static String CommnQuestionsroute = '/CommnQuestionsroute';
  static String Featuresroute = '/Featuresroute';
  static String Pagesroute = '/Pagesroute';
  static String Mangersroute = '/Mangersroute';
}

class SubPagesPath {
  static String ShowCardFieldDeatils = 'ShowCardFieldDeatils';
  static String ShowWebsiteContentMangementDeatils =
      'ShowWebsiteContentMangementDeatils';
  static String ShowRegionDeatils = 'ShowRegionDeatils';
  static String ShowCityDeatils = 'ShowCityDeatils';
  static String ShowNationailtyDeatils = 'ShowNationailtyDeatils';
  static String ShowMessageTeplateDeatils = 'ShowMessageTeplateDeatils';
  static String ShowEmailMenuDeatils = 'ShowEmailMenuDeatils';
  static String ShowEmailListGroupDeatils = 'ShowEmailListGroupDeatils';
  static String ShowPartnersDeatils = 'ShowPartnersDeatils';
  static String ShowBranchesDeatils = 'ShowBranchesDeatils';
  static String ShowOfferDeatils = 'ShowOfferDeatils';
  static String ShowCustomersDeatils = 'ShowCustomersDeatils';
  static String ShowCardDeatils = 'ShowCardDeatils';
  static String ShowDisCountCodeDeatils = 'ShowDisCountCodeDeatils';
  static String ShowServiceDeatils = 'ShowServiceDeatils';
  static String ShowContactUsDeatils = 'ShowContactUsDeatils';
  static String ShowJionUsDeatils = 'ShowJionUsDeatils';
  static String ShowSliderDeatils = 'ShowSliderDeatils';
  static String ShowBannersDeatils = 'ShowBannersDeatils';
  static String ShowCommnQuestionsDeatils = 'ShowCommnQuestionsDeatils';
  static String ShowFeaturesDeatils = 'ShowFeaturesDeatils';
  static String ShowPagesDeatils = 'ShowPagesDeatils';
  static String ShowMangersDeatils = 'ShowMangersDeatils';

//  Add New Item Pages
  static String AddCardField = 'AddCardField';
  static String AddWebsiteContentMangement = 'AddWebsiteContentMangement';
  static String AddRegion = 'AddRegion';
  static String AddCity = 'AddCity';
  static String AddNationality = 'AddNationality';
  static String AddEmailMenu = 'AddEmailMenu';
  static String AddEmailListGroup = 'AddEmailListGroup';
  static String AddPartner = 'AddPartner';
  static String AddOffers = 'AddOffers';
  static String AddDisCountCode = 'AddDisCountCode';
  static String AddService = 'AddService';
  static String AddBanners = 'AddBanners';
  static String AddSliders = 'AddSliders';
  static String AddCommnQuestions = 'AddCommnQuestions';
  static String AddFeatures = 'AddFeatures';
  static String AddPages = 'AddPages';
  static String AddMangers = 'AddMangers';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorCardfieldsKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorCardfieldsKey');
final _shellNavigatorWebsiteContentMangementKey = GlobalKey<NavigatorState>(
    debugLabel: '_shellNavigatorWebsiteContentMangementKey');
final _shellNavigatorRegionsKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorRegionsKey');
final _shellNavigatorCitiesKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorCitiesKey');
final _shellNavigatorNationalityKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorNationalityKey');
final _shellNavigatorMessagetemplateKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorMessagetemplateKey');
final _shellNavigatorEmailMenuKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorEmailMenuKey');
final _shellNavigatorEmailListGroupKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorEmailListGroupKey');
final _shellNavigatorpaertnerKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorpaertnerKey');
final _shellNavigatorBranchesKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorBranchesKey');
final _shellNavigatoroffersKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatoroffersKey');
final _shellNavigatorCardKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorCardKey');
final _shellNavigatorDisCountCodeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorDisCountCode');
final _shellNavigatorCustomersKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorCustomers');
final _shellNavigatorServiceKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorServiceKey');
final _shellNavigatorContactUsKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorContactUsKey');
final _shellNavigatorJionUsKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorJionUsKey');
final _shellNavigatorSlidersKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorJionUsKey');
final _shellNavigatorBannersKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorBannersKey');
final _shellNavigatorCommnQuestionsKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorCommnQuestionsKey');
final _shellNavigatorFeaturesKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorFeaturesKey');
final _shellNavigatorPagesKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorPagesKey');
final _shellNavigatorMangersKey =
    GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorPagesKey');
final goRouter = GoRouter(
  initialLocation: NamedPath.initialLocation,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCardfieldsKey,
          routes: [
            GoRoute(
              path: NamedPath.initialLocation,
              pageBuilder: (context, state) => NoTransitionPage(
                child: CardfieldScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowCardFieldDeatils,
                  path: 'ShowCardFieldDeatilsPath',
                  builder: (context, state) => ShowCardFieldDeatils(
                      Cardfield: BlocProvider.of<CardFieldCubit>(context)
                          .cardFieldbyIdModel!),
                ),
                GoRoute(
                    onExit: (context) async {
                      await BlocProvider.of<CardFieldCubit>(context)
                          .RemoveData();
                      return true;
                    },
                    name: SubPagesPath.AddCardField,
                    path: 'AddCardFieldPath',
                    builder: (context, state) {
                      final Map<String, dynamic>? extra =
                          state.extra as Map<String, dynamic>?;
                      final isAdd = extra?['isAdd'] ?? true;
                      return AddCardField(
                        isAdd: isAdd,
                      );
                    }),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorWebsiteContentMangementKey,
          routes: [
            GoRoute(
              path: NamedPath.WebsiteContentMangementRoute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: WebsiteContentMangementScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowWebsiteContentMangementDeatils,
                  path: 'ShowWebsiteContentMangementDeatilsPath',
                  builder: (context, state) =>
                      ShowWebsiteContentMangementDetails(
                    WebsiteContentMangementbyIdModel:
                        BlocProvider.of<WebsiteContentMangementCubit>(context)
                            .WebsiteContentMangementbyIdModel,
                  ),
                ),
                GoRoute(
                    onExit: (context) {
                      BlocProvider.of<WebsiteContentMangementCubit>(context)
                          .RemoveData();
                      return true;
                    },
                    name: SubPagesPath.AddWebsiteContentMangement,
                    path: 'AddWebsiteContentMangementPath',
                    builder: (context, state) {
                      final Map<String, dynamic>? extra =
                          state.extra as Map<String, dynamic>?;
                      final isAdd = extra?['isAdd'] ?? true;
                      return AddWebsiteContentMangement(
                        isAdd: isAdd,
                      );
                    }),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorRegionsKey,
          routes: [
            GoRoute(
              path: NamedPath.RegionRoute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: RegionScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowRegionDeatils,
                  path: 'ShowRegionDeatilsPath',
                  builder: (context, state) => ShowRegionDeatils(
                    regionModel:
                        BlocProvider.of<RegionCubit>(context).RegionbyIdModel,
                  ),
                ),
                GoRoute(
                    onExit: (context) async {
                      await BlocProvider.of<RegionCubit>(context).RemoveData();
                      return true;
                    },
                    name: SubPagesPath.AddRegion,
                    path: 'AddRegionPath',
                    builder: (context, state) {
                      final Map<String, dynamic>? extra =
                          state.extra as Map<String, dynamic>?;

                      final isAdd = extra?['isAdd'] ?? true;
                      // final regionModel = extra?['regionModel'] as RegionModel?;
                      return AddRegion(
                        isAdd: isAdd,
                        // regionModel: regionModel ??
                        //     BlocProvider.of<RegionCubit>(context)
                        //         .RegionbyIdModel,
                      );
                    }),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCitiesKey,
          routes: [
            GoRoute(
              path: NamedPath.CitiesRoute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: CitiesScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowCityDeatils,
                  path: 'ShowCityDeatilsPath',
                  builder: (context, state) => ShowCityDeatilds(
                    cityModel:
                        BlocProvider.of<CitiesCubit>(context).CitybyIdModel,
                  ),
                ),
                GoRoute(
                  onExit: (context) async {
                    await BlocProvider.of<CitiesCubit>(context).RemoveData();
                    return true;
                  },
                  name: SubPagesPath.AddCity,
                  path: 'AddCityPath',
                  builder: (context, state) {
                    final Map<String, dynamic>? extra =
                        state.extra as Map<String, dynamic>?;

                    final isAdd = extra?['isAdd'] ?? true;
                    // final cityModel = extra?['cityModel'] as CityModel?;
                    return AddCity(
                      isAdd: isAdd,
                      // cityModel: cityModel ??
                      //     BlocProvider.of<CitiesCubit>(context)
                      //         .CitybyIdModel
                    );
                  },
                )
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorNationalityKey,
          routes: [
            GoRoute(
              path: NamedPath.NationailtyRoute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: NationalityScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowNationailtyDeatils,
                  path: 'ShowNationailtyDeatils',
                  builder: (context, state) => ShowNationnailtyDetails(
                    NationnailtybyIdModel:
                        BlocProvider.of<NationnalityCubit>(context)
                            .NationnalitybyIdModel,
                  ),
                ),
                GoRoute(
                    onExit: (context) {
                      BlocProvider.of<NationnalityCubit>(context).RemoveData();
                      return true;
                    },
                    name: SubPagesPath.AddNationality,
                    path: 'AddNationalitypath',
                    builder: (context, state) {
                      final Map<String, dynamic>? extra =
                          state.extra as Map<String, dynamic>?;

                      final isAdd = extra?['isAdd'] ?? true;
                      return AddNationality(
                        isAdd: isAdd,
                      );
                    }),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMessagetemplateKey,
          routes: [
            GoRoute(
              path: NamedPath.MessageteplateRoute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: MessagetemplateScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowMessageTeplateDeatils,
                  path: 'ShowMessageTeplateDeatilsPath',
                  builder: (context, state) => ShowMessagetemplateDetails(
                    MessagetemplatebyIdModel:
                        BlocProvider.of<MessagetemplatesCubit>(context)
                            .MessagetemplatebyIdModel,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorEmailMenuKey,
          routes: [
            GoRoute(
              path: NamedPath.EmailMenuRoute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: EmailMenucreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowEmailMenuDeatils,
                  path: 'ShowEmailMenuDeatilsPath',
                  builder: (context, state) => ShowEmailMenuDetails(
                    EmailMenubyIdModel: BlocProvider.of<EmailMenuCubit>(context)
                        .EmailMenubyIdModel,
                  ),
                ),
                GoRoute(
                    onExit: (context) {
                      BlocProvider.of<EmailMenuCubit>(context).RemoveData();
                      return true;
                    },
                    name: SubPagesPath.AddEmailMenu,
                    path: 'AddEmailMenuPath',
                    builder: (context, state) {
                      final Map<String, dynamic>? extra =
                          state.extra as Map<String, dynamic>?;
                      final isAdd = extra?['isAdd'] ?? true;
                      return AddEmailMenu(isAdd: isAdd);
                    }),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorEmailListGroupKey,
          routes: [
            GoRoute(
              path: NamedPath.EmailListGroupRoute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: EmailListGrpoupcreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowEmailListGroupDeatils,
                  path: 'ShowEmailListGroupDeatilsPath',
                  builder: (context, state) => ShowEmailListGrpoupDetails(
                    EmailListGrpoupbyIdModel:
                        BlocProvider.of<EmailListGrpoupCubit>(context)
                            .EmailListGrpoupbyIdModel,
                  ),
                ),
                GoRoute(
                    onExit: (context) {
                      BlocProvider.of<EmailListGrpoupCubit>(context)
                          .RemoveData();
                      return true;
                    },
                    name: SubPagesPath.AddEmailListGroup,
                    path: 'AddEmailListGroupPath',
                    builder: (context, state) {
                      final Map<String, dynamic>? extra =
                          state.extra as Map<String, dynamic>?;
                      final isAdd = extra?['isAdd'] ?? true;
                      return AddEmailListGroup(isAdd: isAdd);
                    }),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorpaertnerKey,
          routes: [
            GoRoute(
              path: NamedPath.partnerroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: PartnersScreen(),
              ),
              routes: [
                GoRoute(
                    onExit: (context) {
                      return true;
                    },
                    name: SubPagesPath.AddPartner,
                    path: 'AddPartnerpath',
                    builder: (context, state) {
                      final Map<String, dynamic>? extra =
                          state.extra as Map<String, dynamic>?;
                      final isAdd = extra?['isAdd'] ?? true;
                      return AddEditPartnner(
                        isAdd: isAdd,
                      );
                    }),
                GoRoute(
                  name: SubPagesPath.ShowPartnersDeatils,
                  path: 'ShowPartnerDetailspath',
                  builder: (context, state) => ShowPartnerDetails(
                      partnerbyIdModel:
                          BlocProvider.of<PartnerCubit>(context).partnerModel!),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBranchesKey,
          routes: [
            GoRoute(
              path: NamedPath.Branchesroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: BranchesScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowBranchesDeatils,
                  path: 'ShowBranchesDeatilspath',
                  builder: (context, state) => ShowBranchesDeatils(
                      BranchessModel: BlocProvider.of<BranchesCubit>(context)
                          .BranchesbyIdModel!),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatoroffersKey,
          routes: [
            GoRoute(
              path: NamedPath.offersroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: OffersScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowOfferDeatils,
                  path: 'ShowofferDeatils',
                  builder: (context, state) => ShowofferDeatils(
                      offersModel: BlocProvider.of<OffersCubit>(context)
                          .OfferbyIdModel!),
                ),
                GoRoute(
                    onExit: (context) {
                      BlocProvider.of<OffersCubit>(context).RemoveData();
                      return true;
                    },
                    name: SubPagesPath.AddOffers,
                    path: 'AddOfferspath',
                    builder: (context, state) {
                      final Map<String, dynamic>? extra =
                          state.extra as Map<String, dynamic>?;
                      final isAdd = extra?['isAdd'] ?? true;
                      return AddOffers(
                        isAdd: isAdd,
                      );
                    }),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCardKey,
          routes: [
            GoRoute(
              path: NamedPath.Cardroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: CardScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowCardDeatils,
                  path: 'ShowCardDeatilsPath',
                  builder: (context, state) => ShowCardDetails(
                    CardbyIdModel:
                        BlocProvider.of<CardCubit>(context).CardbyIdModel!,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDisCountCodeKey,
          routes: [
            GoRoute(
              path: NamedPath.DisCountCoderoute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: DisCountCodecreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowDisCountCodeDeatils,
                  path: 'ShowDisCountCodeDeatilsPath',
                  builder: (context, state) => ShowDiscountCodeDetails(
                    DiscountCodebyIdModel:
                        BlocProvider.of<DiscountCodeCubit>(context)
                            .DiscountCodebyIdModel!,
                  ),
                ),
                GoRoute(
                  name: SubPagesPath.AddDisCountCode,
                  path: 'AddDisCountCodePath',
                  builder: (context, state) => AddDisCountCode(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCustomersKey,
          routes: [
            GoRoute(
              path: NamedPath.Customersoute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: Customerscreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowCustomersDeatils,
                  path: 'ShowCustomersDeatilsPath',
                  builder: (context, state) => ShowCustomersDetails(
                    CustomersbyIdModel: BlocProvider.of<CustomersCubit>(context)
                        .CustomersbyIdModel!,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorServiceKey,
          routes: [
            GoRoute(
              path: NamedPath.Serviceroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: ServiceScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowServiceDeatils,
                  path: 'ShowServiceDeatilsPath',
                  builder: (context, state) => ShowServiceDeatils(
                    serviceModel: BlocProvider.of<ServiceCubit>(context)
                        .ServicebyIdModel!,
                  ),
                ),
                GoRoute(
                  name: SubPagesPath.AddService,
                  path: 'AddServicePat',
                  builder: (context, state) => AddService(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorContactUsKey,
          routes: [
            GoRoute(
              path: NamedPath.Contactusroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: ContactUscreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowContactUsDeatils,
                  path: 'ShowContactUsDeatilsPath',
                  builder: (context, state) => ShowContactUsDetails(
                    ContactUsbyIdModel: BlocProvider.of<ContactUsCubit>(context)
                        .ContactUsbyIdModel!,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorJionUsKey,
          routes: [
            GoRoute(
              path: NamedPath.JionUsroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: JionUscreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowJionUsDeatils,
                  path: 'ShowJionUsDeatilsPath',
                  builder: (context, state) => ShowJionUsDetails(
                    JionUsbyIdModel:
                        BlocProvider.of<JionUsCubit>(context).JionUsbyIdModel!,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSlidersKey,
          routes: [
            GoRoute(
              path: NamedPath.SLidersroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: SliderScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowSliderDeatils,
                  path: 'ShowSliderDeatilsPath',
                  builder: (context, state) => ShowSliderDetails(
                    SliderbyIdModel:
                        BlocProvider.of<SlidersCubit>(context).SliderbyIdModel!,
                  ),
                ),
                GoRoute(
                    onExit: (context) {
                      BlocProvider.of<SlidersCubit>(context).RemoveData();
                      return true;
                    },
                    name: SubPagesPath.AddSliders,
                    path: 'AddSlidersPath',
                    builder: (context, state) {
                      final Map<String, dynamic>? extra =
                          state.extra as Map<String, dynamic>?;
                      final isAdd = extra?['isAdd'] ?? true;
                      return AddSliders(isAdd: isAdd);
                    }),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBannersKey,
          routes: [
            GoRoute(
              path: NamedPath.Bannersroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: Bannerscreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowBannersDeatils,
                  path: 'ShowBannersDeatilsPath',
                  builder: (context, state) => ShowBannersDetails(
                    BannersbyIdModel: BlocProvider.of<BannersCubit>(context)
                        .BannersbyIdModel!,
                  ),
                ),
                GoRoute(
                  onExit: (context) {
                    BlocProvider.of<BannersCubit>(context).RemoveData();
                    return true;
                  },
                  name: SubPagesPath.AddBanners,
                  path: 'AddBannersPath',
                  builder: (context, state) {
                    final Map<String, dynamic>? extra =
                        state.extra as Map<String, dynamic>?;
                    final isAdd = extra?['isAdd'] ?? true;
                    return AddBanners(
                      isAdd: isAdd,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCommnQuestionsKey,
          routes: [
            GoRoute(
              path: NamedPath.CommnQuestionsroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: CommnQuestionsScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowCommnQuestionsDeatils,
                  path: 'ShowCommnQuestionsDeatilsPath',
                  builder: (context, state) => ShowCommnQuestionsDetails(
                    CommnQuestionsbyIdModel:
                        BlocProvider.of<CommnQuestionsCubit>(context)
                            .CommnQuestionsbyIdModel!,
                  ),
                ),
                GoRoute(
                  onExit: (context) {
                    BlocProvider.of<CommnQuestionsCubit>(context).RemoveData();
                    return true;
                  },
                  name: SubPagesPath.AddCommnQuestions,
                  path: 'AddCommnQuestionsPath',
                  builder: (context, state) {
                    final Map<String, dynamic>? extra =
                        state.extra as Map<String, dynamic>?;
                    final isAdd = extra?['isAdd'] ?? true;
                    return AddCommnQuestions(
                      isAdd: isAdd,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorFeaturesKey,
          routes: [
            GoRoute(
              path: NamedPath.Featuresroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: FeaturesScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowFeaturesDeatils,
                  path: 'ShowFeaturesDeatilsPath',
                  builder: (context, state) => ShowFeaturesDetails(
                    FeaturesbyIdModel: BlocProvider.of<FeaturesCubit>(context)
                        .FeaturesbyIdModel!,
                  ),
                ),
                GoRoute(
                  onExit: (context) {
                    BlocProvider.of<FeaturesCubit>(context).RemoveData();
                    return true;
                  },
                  name: SubPagesPath.AddFeatures,
                  path: 'AddFeaturesPath',
                  builder: (context, state) {
                    final Map<String, dynamic>? extra =
                        state.extra as Map<String, dynamic>?;
                    final isAdd = extra?['isAdd'] ?? true;
                    return AddFeatures(
                      isAdd: isAdd,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorPagesKey,
          routes: [
            GoRoute(
              path: NamedPath.Pagesroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: PagesScreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowPagesDeatils,
                  path: 'ShowPagesDeatilsPath',
                  builder: (context, state) => ShowPagesDetails(
                    PagesbyIdModel:
                        BlocProvider.of<PagesCubit>(context).PagesbyIdModel!,
                  ),
                ),
                GoRoute(
                    onExit: (context) {
                      BlocProvider.of<PagesCubit>(context).RemoveData();
                      return true;
                    },
                    name: SubPagesPath.AddPages,
                    path: 'AddPagesPath',
                    builder: (context, state) {
                      final Map<String, dynamic>? extra =
                          state.extra as Map<String, dynamic>?;
                      final isAdd = extra?['isAdd'] ?? true;
                      return AddPages(isAdd: isAdd);
                    }),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMangersKey,
          routes: [
            GoRoute(
              path: NamedPath.Mangersroute,
              pageBuilder: (context, state) => NoTransitionPage(
                child: Mangerscreen(),
              ),
              routes: [
                GoRoute(
                  name: SubPagesPath.ShowMangersDeatils,
                  path: 'ShowMangersDeatilsPath',
                  builder: (context, state) => ShowMangersDetails(
                    MangersbyIdModel: BlocProvider.of<MangersCubit>(context)
                        .MangersbyIdModel!,
                  ),
                ),
                GoRoute(
                  onExit: (context) {
                    BlocProvider.of<MangersCubit>(context).RemoveData();
                    return true;
                  },
                  name: SubPagesPath.AddMangers,
                  path: 'AddMangersPath',
                  builder: (context, state) {
                    final Map<String, dynamic>? extra =
                        state.extra as Map<String, dynamic>?;
                    final isAdd = extra?['isAdd'] ?? true;
                    return AddMangers(
                      isAdd: isAdd,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigationRail(
      body: navigationShell,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;

  final Function(int) onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(),
          Expanded(
            child: Row(
              children: [
                SingleChildScrollView(
                  child: AnimatedContainer(
                    decoration: const BoxDecoration(color: Color(0xffF9FAFC)),
                    width: MediaQuery.of(context).size.width * .2,
                    duration: const Duration(seconds: 1),
                    child: Column(
                      children: [
                        ExpansionTile(
                          title: const ListTile(
                            title: Text(
                              'WebSiteMangement',
                              style: TextStyle(color: Color(0xff444444)),
                            ),
                          ),
                          children: [
                            ListTile(
                                leading:
                                    Image.asset('assets/images/Vector.png'),
                                title: const Text(
                                  'Cardfield',
                                  style: TextStyle(color: Color(0xff444444)),
                                ),
                                onTap: () {
                                  onDestinationSelected(0);
                                  // context.goNamed('details'),
                                }),
                            ListTile(
                                leading:
                                    Image.asset('assets/images/Vector.png'),
                                title: const Text(
                                  'WebSiteContentMangement',
                                  style: TextStyle(color: Color(0xff444444)),
                                ),
                                onTap: () {
                                  onDestinationSelected(1);
                                  // context.goNamed('details'),
                                }),
                            ListTile(
                                leading:
                                    Image.asset('assets/images/Vector.png'),
                                title: const Text(
                                  'Region',
                                  style: TextStyle(color: Color(0xff444444)),
                                ),
                                onTap: () {
                                  onDestinationSelected(2);
                                  // context.goNamed('details'),
                                }),
                            ListTile(
                                leading:
                                    Image.asset('assets/images/Vector.png'),
                                title: const Text(
                                  'cities',
                                  style: TextStyle(color: Color(0xff444444)),
                                ),
                                onTap: () {
                                  onDestinationSelected(3);
                                  // context.goNamed('details'),
                                }),
                            ListTile(
                                leading:
                                    Image.asset('assets/images/Vector.png'),
                                title: const Text(
                                  'Nationailty',
                                  style: TextStyle(color: Color(0xff444444)),
                                ),
                                onTap: () {
                                  onDestinationSelected(4);
                                  // context.goNamed('details'),
                                }),
                            ListTile(
                                leading:
                                    Image.asset('assets/images/Vector.png'),
                                title: const Text(
                                  'Message Template',
                                  style: TextStyle(color: Color(0xff444444)),
                                ),
                                onTap: () {
                                  onDestinationSelected(5);
                                  // context.goNamed('details'),
                                }),
                          ],
                        ),
                        ExpansionTile(
                          title: const ListTile(
                            title: Text('EmailMessages'),
                          ),
                          children: [
                            ListTile(
                              title: const Text('EmailMenu'),
                              onTap: () {
                                onDestinationSelected(6);
                              },
                            ),
                            ListTile(
                              title: const Text('EmailListGroup'),
                              onTap: () {
                                onDestinationSelected(7);
                              },
                            ),
                          ],
                        ),
                        ExpansionTile(
                          title: const ListTile(
                            title: Text('Partners'),
                          ),
                          children: [
                            ListTile(
                              title: const Text('Partners'),
                              onTap: () {
                                onDestinationSelected(8);
                              },
                            ),
                            ListTile(
                              title: const Text('Branches'),
                              onTap: () {
                                onDestinationSelected(9);
                              },
                            ),
                            ListTile(
                              title: const Text('Offers'),
                              onTap: () {
                                onDestinationSelected(10);
                              },
                            ),
                          ],
                        ),
                        ExpansionTile(
                          title: const ListTile(
                            title: Text('Cards'),
                          ),
                          children: [
                            ListTile(
                              title: const Text('Cards'),
                              onTap: () {
                                onDestinationSelected(11);
                              },
                            ),
                            ListTile(
                              title: const Text('DiscountCode'),
                              onTap: () {
                                onDestinationSelected(12);
                              },
                            ),
                          ],
                        ),
                        ExpansionTile(
                          title: const ListTile(
                            title: Text('Customers'),
                          ),
                          children: [
                            ListTile(
                              title: const Text('Customers'),
                              onTap: () {
                                onDestinationSelected(13);
                              },
                            ),
                          ],
                        ),
                        ExpansionTile(
                          title: const ListTile(
                            title: Text('Services'),
                          ),
                          children: [
                            ListTile(
                              title: const Text('Services'),
                              onTap: () {
                                onDestinationSelected(14);
                              },
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('ContactUs'),
                          onTap: () {
                            onDestinationSelected(15);
                          },
                        ),
                        ListTile(
                          title: const Text('JionUs'),
                          onTap: () {
                            onDestinationSelected(16);
                          },
                        ),
                        ListTile(
                          title: const Text('Sliders'),
                          onTap: () {
                            onDestinationSelected(17);
                          },
                        ),
                        ListTile(
                          title: const Text('Banners'),
                          onTap: () {
                            onDestinationSelected(18);
                          },
                        ),
                        ListTile(
                          title: const Text('Commn Questions'),
                          onTap: () {
                            onDestinationSelected(19);
                          },
                        ),
                        ListTile(
                          title: const Text('features'),
                          onTap: () {
                            onDestinationSelected(20);
                          },
                        ),
                        ListTile(
                          title: const Text('Pages'),
                          onTap: () {
                            onDestinationSelected(21);
                          },
                        ),
                        ListTile(
                          title: const Text('Mangers'),
                          onTap: () {
                            onDestinationSelected(22);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(thickness: 1, width: 1),
                // This is the main content.
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: body),
                      LayoutFotter(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
