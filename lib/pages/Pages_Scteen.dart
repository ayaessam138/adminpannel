import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/pages/PagesModel.dart';
import 'package:afcooadminpanel/pages/pages_cubit.dart';
import 'package:afcooadminpanel/pages/pages_datasource.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PagesScreen extends StatelessWidget {
  PagesScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PagesCubit, PagesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is PagesLoading
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
                          title: 'Pages',
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
                                              .goNamed(SubPagesPath.AddPages);
                                        },
                                        title: 'Add Pages',
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
                                      source: PagesDataSource(
                                        PagesList:
                                            BlocProvider.of<PagesCubit>(context)
                                                .PagesList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          PagesModel Pagesmodel =
                                              BlocProvider.of<PagesCubit>(
                                                      context)
                                                  .PagesList[index];

                                          await BlocProvider.of<PagesCubit>(
                                                  context)
                                              .GetPagesbyid(id: Pagesmodel.id)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowPagesDeatils));
                                        },
                                        doEdit: (int index) {
                                          PagesModel Pagesmodel =
                                              BlocProvider.of<PagesCubit>(
                                                      context)
                                                  .PagesList[index];
                                          BlocProvider.of<PagesCubit>(context)
                                              .EditPages(Pagesmodel);
                                          context.goNamed(SubPagesPath.AddPages,
                                              extra: {'isAdd': false});
                                        },
                                        doRemove: (int index) {
                                          PagesModel Pagesmodel =
                                              BlocProvider.of<PagesCubit>(
                                                      context)
                                                  .PagesList[index];
                                          BlocProvider.of<PagesCubit>(context)
                                              .RemovePages(
                                                  PagesId: Pagesmodel.id,
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
                                            columnName: 'title',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
                                            label: GridHeader(
                                              title: 'title',
                                            )),
                                        GridColumn(
                                            columnName: 'title in English',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
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
                                            columnName: 'Created At',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'Created At',
                                            )),
                                        GridColumn(
                                            columnName: 'ShowDeatils',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'Show Deatils',
                                            ))
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
