import 'dart:ui';

import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/app_bar_widght.dart';
import 'package:afcooadminpanel/Core/layout/Layout.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/Partner/partners/Models/PartnerModel.dart';
import 'package:afcooadminpanel/Partner/partners/PartnerCubit/partner_cubit.dart';
import 'package:afcooadminpanel/Partner/partners/Views/AddEditPartner/Add_edit_partner.dart';


import 'package:afcooadminpanel/Partner/partners/Views/Partner_datasource.dart';
import 'package:afcooadminpanel/Partner/partners/Views/ShowPartnerDeatils.dart';

import 'package:afcooadminpanel/WebsiteMangement/cities/cities_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PartnersScreen extends StatelessWidget {
  PartnersScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PartnerCubit, PartnerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is GetPartnerLoading
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
                          title: 'Partners',
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
                                          context
                                              .goNamed(SubPagesPath.AddPartner);
                                        },
                                        title: 'Add Partner',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .06,
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                      source: PartnerDataSource(
                                        PartnerList:
                                            BlocProvider.of<PartnerCubit>(
                                                    context)
                                                .PartnersList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          PartnerModel partnerModel =
                                              BlocProvider.of<PartnerCubit>(
                                                      context)
                                                  .PartnersList[index];

                                          await BlocProvider.of<PartnerCubit>(
                                                  context)
                                              .GetPartnerbyid(
                                                  id: partnerModel.id!)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowPartnersDeatils));
                                        },
                                        doEdit: (int index) async {
                                          PartnerModel partnerModel =
                                              BlocProvider.of<PartnerCubit>(
                                                      context)
                                                  .PartnersList[index];

                                          await BlocProvider.of<PartnerCubit>(
                                                  context)
                                              .GetPartnerbyid(
                                                  id: partnerModel.id!)
                                              .then((value) => BlocProvider.of<
                                                      PartnerCubit>(context)
                                                  .EditPartner(BlocProvider.of<
                                                          PartnerCubit>(context)
                                                      .partnerModel))
                                              .then((value) => context.goNamed(
                                                  SubPagesPath.AddPartner,
                                                  extra: {'isAdd': false}));
                                        },
                                        doRemove: (int index) {
                                          PartnerModel partnerModel =
                                              BlocProvider.of<PartnerCubit>(
                                                      context)
                                                  .PartnersList[index];
                                          BlocProvider.of<PartnerCubit>(context)
                                              .RemovePartner(
                                                  PartnerId: partnerModel.id!,
                                                  index: index);
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
                                              title: 'Number',
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
                                            columnName: 'cate_name',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
                                            label: GridHeader(
                                              title: 'Categorey Name',
                                            )),
                                        GridColumn(
                                            columnName: 'slug',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
                                            label: GridHeader(
                                              title: 'Slug',
                                            )),
                                        GridColumn(
                                            columnName: 'branches_num',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'Branches Number',
                                            )),
                                        GridColumn(
                                            columnName: 'offer_num',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'Branches Number',
                                            )),
                                        GridColumn(
                                            columnName: 'services_num',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'Service Number',
                                            )),
                                        GridColumn(
                                            columnName: 'status',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'status',
                                            )),
                                        GridColumn(
                                            visible: true,
                                            columnName: 'Show Deatils',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .07,
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
