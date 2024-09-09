import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/EmailMeesages/emailMenu/EmailMenu_DataSource.dart';
import 'package:afcooadminpanel/EmailMeesages/emailMenu/emailMenuModel.dart';
import 'package:afcooadminpanel/EmailMeesages/emailMenu/email_menu_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmailMenucreen extends StatelessWidget {
  EmailMenucreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailMenuCubit, EmailMenuState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is EmailMenuLoading
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
                          title: 'EmailMenu',
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
                                              SubPagesPath.AddEmailMenu);
                                        },
                                        title: 'Add EmailMenu',
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
                                      source: EmailMenuDataSource(
                                        EmailMenuList:
                                            BlocProvider.of<EmailMenuCubit>(
                                                    context)
                                                .EmailMenuList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          EmailMenuModel EmailMenumodel =
                                              BlocProvider.of<EmailMenuCubit>(
                                                      context)
                                                  .EmailMenuList[index];

                                          await BlocProvider.of<EmailMenuCubit>(
                                                  context)
                                              .GetEmailMenubyid(
                                                  id: EmailMenumodel.id)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowEmailMenuDeatils));
                                        },
                                        doEdit: (int index) {
                                          EmailMenuModel EmailMenumodel =
                                              BlocProvider.of<EmailMenuCubit>(
                                                      context)
                                                  .EmailMenuList[index];
                                          BlocProvider.of<EmailMenuCubit>(
                                                  context)
                                              .EditEmailMenu(EmailMenumodel);
                                          context.goNamed(
                                              SubPagesPath.AddEmailMenu,
                                              extra: {'isAdd': false});
                                        },
                                        doRemove: (int index) {
                                          EmailMenuModel EmailMenumodel =
                                              BlocProvider.of<EmailMenuCubit>(
                                                      context)
                                                  .EmailMenuList[index];
                                          BlocProvider.of<EmailMenuCubit>(
                                                  context)
                                              .RemoveEmailMenu(
                                                  EmailMenuId:
                                                      EmailMenumodel.id,
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
                                            columnName: 'mobile',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .03,
                                            label: GridHeader(
                                              title: 'mobile',
                                            )),
                                        GridColumn(
                                            columnName: 'companyName',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'companyName',
                                            )),
                                        GridColumn(
                                            columnName: 'emailGroup',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'emailGroup',
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
