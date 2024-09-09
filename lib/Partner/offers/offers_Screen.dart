import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/Partner/offers/OffersModel.dart';
import 'package:afcooadminpanel/Partner/offers/offers_cubit.dart';
import 'package:afcooadminpanel/Partner/offers/offers_dataSourcs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OffersScreen extends StatelessWidget {
  OffersScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OffersCubit, OffersState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is OffersLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.red,
                      ),
                    )
                  : Column(
                      children: [
                        // SizedBox(height:100,child: BreadcrumbScreen()),
                        const TabHeader(
                          title: 'Offers',
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    top: BorderSide(
                                        width: 3, color: Color(0xff3C8DBC)))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomButton(
                                        onTap: () {


                                          context.goNamed(SubPagesPath.AddOffers);

                                        },
                                        title: 'Add Offer',
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            .06,
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            .07,
                                        textcolor: Colors.white,
                                        backGroundcolor:
                                            const Color(0xff095A56),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Expanded(
                                    child: SfDataGrid(
                                      key: gridKey,
                                      source: OffersDataSource(
                                        OffersList:
                                            BlocProvider.of<OffersCubit>(
                                                    context)
                                                .OffersList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          OffersModel Offersmodel =
                                              BlocProvider.of<OffersCubit>(
                                                      context)
                                                  .OffersList[index];

                                          await BlocProvider.of<OffersCubit>(
                                              context)
                                              .GetOfferbyid(
                                              id: Offersmodel.id)
                                              .then((value) =>
                                             context.goNamed(SubPagesPath.ShowOfferDeatils));
                                        },
                                        doEdit: (int index) {

                                          OffersModel offersModel =
                                          BlocProvider.of<OffersCubit>(
                                              context)
                                              .OffersList[index];
                                          BlocProvider.of<OffersCubit>(
                                              context).Editofffer(offersModel);
                                          context.goNamed(SubPagesPath.AddOffers,extra: {'isAdd':false});
                                        },
                                        doRemove: (int index) {
                                          OffersModel offersModel =
                                              BlocProvider.of<OffersCubit>(
                                                      context)
                                                  .OffersList[index];
                                          BlocProvider.of<OffersCubit>(
                                                  context)
                                              .Removeoffer(
                                                  index: index,
                                                  offerId: offersModel.id);

                                        },
                                        gridKey: gridKey,
                                      ),
                                      columns: [
                                        GridColumn(
                                            visible: true,
                                            columnName: 'index',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .03,
                                            label: GridHeader(
                                              title: '#',
                                            )),
                                        GridColumn(
                                            visible: true,
                                            columnName: 'id',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .03,
                                            label: GridHeader(
                                              title: 'id',
                                            )),
                                        GridColumn(
                                            visible: true,
                                            columnName: 'partnername',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'Partner',
                                            )),
                                        GridColumn(
                                            columnName: 'name',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
                                            label: GridHeader(
                                              title: 'name',
                                            )),
                                        GridColumn(
                                            columnName: 'name in English',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
                                            label: GridHeader(
                                              title: 'name in English',
                                            )),
                                        GridColumn(
                                            columnName: 'image',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'Image',
                                            )),
                                        GridColumn(
                                            columnName: 'status',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .13,
                                            label: GridHeader(
                                              title: 'status',
                                            )),
                                        GridColumn(
                                            visible: true,
                                            columnName: 'Show Deatils',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .09,
                                            label: GridHeader(
                                              title: 'Show Deatils',
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
        );
      },
    );
  }
}
