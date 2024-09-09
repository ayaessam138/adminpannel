


import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';

import 'package:afcooadminpanel/WebsiteMangement/region/Region_datasource.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/regionModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/region/region_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RegionScreen extends StatelessWidget {
  RegionScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegionCubit, RegionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
            // appBar:MyAppBar(),
              body: state is GetRegionLoading
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
                    title: 'Region',
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


                                    context.goNamed(SubPagesPath.AddRegion);
                                  },
                                  title: 'Add Region',
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
                                source: RegionDataSource(
                                  RegionList:
                                  BlocProvider.of<RegionCubit>(
                                      context)
                                      .RegionList,
                                  context: context,
                                  doShowDetails: (int index) async {
                                    RegionModel regionmodel =
                                    BlocProvider.of<RegionCubit>(
                                        context)
                                        .RegionList[index];

                                    await BlocProvider.of<RegionCubit>(
                                        context)
                                        .GetRegionbyid(
                                        id: regionmodel.id)
                                        .then((value) =>
                                      context.goNamed(SubPagesPath.ShowRegionDeatils));
                                  },
                                  doEdit: (int index)async {
                                    RegionModel regionmodel =
                                    BlocProvider.of<RegionCubit>(
                                        context)
                                        .RegionList[index];
                                    await BlocProvider.of<RegionCubit>(
                                        context)
                                        .EditRegion(regionmodel);
                                    context.goNamed(SubPagesPath.AddRegion,extra: {'isAdd':false});
                                  },
                                  doRemove: (int index) {
                                    RegionModel regionModel =
                                    BlocProvider.of<RegionCubit>(
                                        context)
                                        .RegionList[index];
                                    BlocProvider.of<RegionCubit>(context)
                                        .RemoveRegion(
                                      RegionId: regionModel.id,
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
                                          .18,
                                      label: GridHeader(
                                        title: 'name',
                                      )),
                                  GridColumn(
                                      columnName: 'name in English',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .18,
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
                                          .10,
                                      label: GridHeader(
                                        title: 'Sort At',
                                      )),
                                  GridColumn(
                                      visible: true,
                                      columnName: 'Show Deatils',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .18,
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


