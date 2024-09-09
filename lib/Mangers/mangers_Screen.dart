
import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/Mangers/Mangers_DataSource.dart';
import 'package:afcooadminpanel/Mangers/mangersModel.dart';
import 'package:afcooadminpanel/Mangers/mangers_cubit.dart';
import 'package:afcooadminpanel/Mangers/showMangerDeatils.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Mangerscreen extends StatelessWidget {
  Mangerscreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MangersCubit, MangersState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
            // appBar:MyAppBar(),
              body: state is MangersLoading
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
                    title: 'Mangers',
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

                                    context.goNamed(SubPagesPath.AddMangers);
                                  },
                                  title: 'Add Mangers',
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
                                source: MangersDataSource(
                                  MangersList:
                                  BlocProvider.of<MangersCubit>(
                                      context)
                                      .MangersList,
                                  context: context,
                                  doShowDetails: (int index) async {
                                    MangersModel Mangersmodel =
                                    BlocProvider.of<MangersCubit>(
                                        context)
                                        .MangersList[index];

                                    await BlocProvider.of<MangersCubit>(
                                        context)
                                        .GetMangersbyid(
                                        id: Mangersmodel.id)
                                        .then((value) =>
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return ShowMangersDetails(
                                                  MangersbyIdModel: BlocProvider
                                                      .of<MangersCubit>(
                                                      context)
                                                      .MangersbyIdModel!,
                                                );
                                              },
                                            )));
                                  },
                                  doEdit: (int index) {

                                    MangersModel Mangersmodel =
                                    BlocProvider.of<MangersCubit>(
                                        context)
                                        .MangersList[index];
                                    BlocProvider.of<MangersCubit>(
                                        context).EditMangers(Mangersmodel);
                                    context.goNamed(SubPagesPath.AddMangers,extra: {'isAdd':false});
                                  },
                                  doRemove: (int index) {
                                    MangersModel mangersmodel =
                                    BlocProvider.of<MangersCubit>(
                                        context)
                                        .MangersList[index];
                                    BlocProvider.of<MangersCubit>(context)
                                        .RemoveMangers(
                                        MangersId: mangersmodel.id,
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
                                      columnName: 'User Name',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .14,
                                      label: GridHeader(
                                        title: 'User Name',
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
                                      columnName: 'image',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .03,
                                      label: GridHeader(
                                        title: 'image',
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
                                      columnName: 'User Type',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .08,
                                      label: GridHeader(
                                        title: 'User Type',
                                      )),
                                  GridColumn(
                                      columnName: 'Created At',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .08,
                                      label: GridHeader(
                                        title: 'Created At',
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
