


import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';

import 'package:afcooadminpanel/WebsiteMangement/Messagetemplates/messageTemplatesModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/Messagetemplates/messagetemplate_datasource.dart';
import 'package:afcooadminpanel/WebsiteMangement/Messagetemplates/messagetemplates_cubit.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MessagetemplateScreen extends StatelessWidget {
  MessagetemplateScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagetemplatesCubit, MessagetemplatesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
            // appBar:MyAppBar(),
              body: state is Messagetemplateloading
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
                    title: 'Message Template',
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

                            const SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              child: SfDataGrid(
                                key: gridKey,
                                source: MessagetemplateDataSource(
                                  MessagetemplateList:
                                  BlocProvider.of<MessagetemplatesCubit>(
                                      context)
                                      .MessagetemplateList,
                                  context: context,
                                  doShowDetails: (int index) async {
                                    MessagetemplateModel Messagetemplatemodel =
                                    BlocProvider.of<MessagetemplatesCubit>(
                                        context)
                                        .MessagetemplateList[index];
                                    //
                                    await BlocProvider.of<MessagetemplatesCubit>(
                                        context)
                                        .GetMessagetemplatebyid(
                                        id: Messagetemplatemodel.id)
                                        .then((value) =>
                                    context.goNamed(
                                      SubPagesPath.ShowMessageTeplateDeatils
                                    ));
                                  },
                                  doEdit: (int index) {


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
                                      columnName: 'emailMessagetitle',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .08,
                                      label: GridHeader(
                                        title: 'Email Message title',
                                      )),
                                  GridColumn(
                                      columnName: 'emailMessagetitle_En',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .08,
                                      label: GridHeader(
                                        title: 'Email Message title in English',
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


