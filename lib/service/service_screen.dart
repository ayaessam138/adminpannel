import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/service/service_Model.dart';
import 'package:afcooadminpanel/service/service_cubit.dart';
import 'package:afcooadminpanel/service/service_dataSource.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ServiceScreen extends StatelessWidget {
  ServiceScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is GetServiceLoading
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
                          title: 'Service',
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


                                          context.goNamed(SubPagesPath.AddService);
                                        },
                                        title: 'Add Service',
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
                                      source: ServiceDataSource(
                                        ServiceList:
                                            BlocProvider.of<ServiceCubit>(
                                                    context)
                                                .ServiceList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          ServiceModel Servicedmodel =
                                              BlocProvider.of<ServiceCubit>(
                                                      context)
                                                  .ServiceList[index];

                                          await BlocProvider.of<ServiceCubit>(
                                                  context)
                                              .GetServicebyid(
                                                  id: Servicedmodel.id)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowServiceDeatils));
                                        },
                                        doEdit: (int index) {},
                                        doRemove: (int index) {
                                          ServiceModel serviceModel =
                                              BlocProvider.of<ServiceCubit>(
                                                      context)
                                                  .ServiceList[index];
                                          BlocProvider.of<ServiceCubit>(context)
                                              .RemoveService(
                                                  index: index,
                                                  ServiceId: serviceModel.id);
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
                                            columnName: 'title',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .22,
                                            label: GridHeader(
                                              title: 'title',
                                            )),
                                        GridColumn(
                                            columnName: 'title in English',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .22,
                                            label: GridHeader(
                                              title: 'title in English',
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
                                                .12,
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
