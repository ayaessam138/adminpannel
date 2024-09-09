import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/WebsiteMangement/cardfield/card_field_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/cardfield/cardfieldModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/cardfield/cardfield_datasource.dart';
import 'package:afcooadminpanel/test.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CardfieldScreen extends StatelessWidget {
  CardfieldScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardFieldCubit, CardFieldState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is GetallCardFieldLoading
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
                          title: 'CardField',
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

                                          context.goNamed(
                                              SubPagesPath.AddCardField);
                                        },
                                        title: 'Add CardField',
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
                                      source: CardfieldDataSource(
                                        CardfieldList:
                                            BlocProvider.of<CardFieldCubit>(
                                                    context)
                                                .CardFieldList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          CardFieldModel Cardfieldmodel =
                                              BlocProvider.of<CardFieldCubit>(
                                                      context)
                                                  .CardFieldList[index];

                                          await BlocProvider.of<CardFieldCubit>(
                                                  context)
                                              .GetcardFieldbyid(
                                                  id: Cardfieldmodel.id)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowCardFieldDeatils));
                                        },
                                        doEdit: (int index) {
                                          CardFieldModel Cardfieldmodel =
                                              BlocProvider.of<CardFieldCubit>(
                                                      context)
                                                  .CardFieldList[index];
                                          BlocProvider.of<CardFieldCubit>(
                                                  context)
                                              .EditCardField(Cardfieldmodel);
                                          context.goNamed(
                                              SubPagesPath.AddCardField,extra: {'isAdd':false});
                                        },
                                        doRemove: (int index) {
                                          CardFieldModel cardFieldModel =
                                              BlocProvider.of<CardFieldCubit>(
                                                      context)
                                                  .CardFieldList[index];
                                          BlocProvider.of<CardFieldCubit>(
                                                  context)
                                              .RemovecardField(
                                                  index: index,
                                                  cardFieldId:
                                                      cardFieldModel.id);
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
                                                .17,
                                            label: GridHeader(
                                              title: 'title',
                                            )),
                                        GridColumn(
                                            columnName: 'title in English',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .17,
                                            label: GridHeader(
                                              title: 'title in English',
                                            )),
                                        GridColumn(
                                            columnName: 'image',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
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
