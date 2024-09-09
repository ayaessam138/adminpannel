
import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/jionUs/jionUsModel.dart';
import 'package:afcooadminpanel/jionUs/jionUs_DataSource.dart';
import 'package:afcooadminpanel/jionUs/jion_us_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class JionUscreen extends StatelessWidget {
  JionUscreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JionUsCubit, JionUsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
            // appBar:MyAppBar(),
              body: state is JionUsLoading
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
                    title: 'JionUs',
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
                                    //
                                    // BlocProvider.of<SliderCubit>(context)
                                    //     .GetallSliderPartner(Sliderid: 9);
                                    // context.go('/editPartnerPath');
                                  },
                                  title: 'Add JionUs',
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
                                source: JionUsDataSource(
                                  JionUsList:
                                  BlocProvider.of<JionUsCubit>(
                                      context)
                                      .JionUsList,
                                  context: context,
                                  doShowDetails: (int index) async {
                                    JionUsModel JionUsmodel =
                                    BlocProvider.of<JionUsCubit>(
                                        context)
                                        .JionUsList[index];

                                    await BlocProvider.of<JionUsCubit>(
                                        context)
                                        .GetJionUsbyid(
                                        id: JionUsmodel.id)
                                        .then((value) =>
                                       context.goNamed(SubPagesPath.ShowJionUsDeatils));
                                  },

                                  doRemove: (int index) {
                                    JionUsModel JionUsmodel =
                                    BlocProvider.of<JionUsCubit>(
                                        context)
                                        .JionUsList[index];
                                    BlocProvider.of<JionUsCubit>(context)
                                        .RemoveJionUs(
                                        JionUsId: JionUsmodel.id,
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
                                      visible: true,
                                      columnName: 'mobile',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .03,
                                      label: GridHeader(
                                        title: 'mobile',
                                      )),
                                  GridColumn(
                                      columnName: 'email',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .14,
                                      label: GridHeader(
                                        title: 'email',
                                      )),

                                  GridColumn(
                                      visible: true,
                                      columnName: 'city',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .03,
                                      label: GridHeader(
                                        title: 'city',
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
                                      columnName: 'ShowDeatils',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .08,
                                      label: GridHeader(
                                        title: 'ShowDeatils',
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
