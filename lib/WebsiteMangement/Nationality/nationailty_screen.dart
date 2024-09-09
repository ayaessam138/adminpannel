


import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';

import 'package:afcooadminpanel/WebsiteMangement/Nationality/nationalityModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/Nationality/nationnailty_DataSource.dart';
import 'package:afcooadminpanel/WebsiteMangement/Nationality/nationnality_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class NationalityScreen extends StatelessWidget {
  NationalityScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NationnalityCubit, NationnalityState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
            // appBar:MyAppBar(),
              body: state is Nationnalityloading
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
                      title: 'Nationality',
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
                                    context.goNamed(SubPagesPath.AddNationality);
                                  },
                                  title: 'Add Nationality',
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
                                source: NationalityDataSource(
                                  NationalityList:
                                  BlocProvider.of<NationnalityCubit>(
                                      context)
                                      .NationalityList,
                                  context: context,
                                  doShowDetails: (int index) async {
                                    NationalityModel Nationalitymodel =
                                    BlocProvider.of<NationnalityCubit>(
                                        context)
                                        .NationalityList[index];

                                    await BlocProvider.of<NationnalityCubit>(
                                        context)
                                        .GetNationnalitybyid(
                                        id: Nationalitymodel.id)
                                        .then((value) =>
                                        context.goNamed(SubPagesPath.ShowNationailtyDeatils));
                                  },
                                  doEdit: (int index) {
                                    NationalityModel Nationalitymodel =
                                    BlocProvider.of<NationnalityCubit>(
                                        context)
                                        .NationalityList[index];
                                    BlocProvider.of<NationnalityCubit>(
                                        context).EditNationnality(Nationalitymodel);
                                    context.goNamed(SubPagesPath.AddNationality,extra: {'isAdd':false});
                                  },
                                  doRemove: (int index) {
                                    NationalityModel Nationalitymodel =
                                    BlocProvider.of<NationnalityCubit>(
                                        context)
                                        .NationalityList[index];
                                    BlocProvider.of<NationnalityCubit>(context)
                                        .RemoveNationnality(
                                        NationnalityId: Nationalitymodel.id,
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
                                        title: 'id',
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
                                      columnName: 'status',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .08,
                                      label: GridHeader(
                                        title: 'status',
                                      )),
                                  GridColumn(
                                      columnName: 'sortat',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .08,
                                      label: GridHeader(
                                        title: 'Sort At',
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


