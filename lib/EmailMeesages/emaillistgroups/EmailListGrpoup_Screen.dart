import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/EmailMeesages/emaillistgroups/EmailListGrpoup_dataSource.dart';
import 'package:afcooadminpanel/EmailMeesages/emaillistgroups/EmaillistgroupsModel.dart';
import 'package:afcooadminpanel/EmailMeesages/emaillistgroups/email_list_grpoup_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmailListGrpoupcreen extends StatelessWidget {
  EmailListGrpoupcreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailListGrpoupCubit, EmailListGrpoupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is EmailListGrpoupLoading
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
                          title: 'EmailListGrpoup',
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
                                              SubPagesPath.AddEmailListGroup);
                                        },
                                        title: 'Add EmailListGrpoup',
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
                                      source: EmailListGrpoupDataSource(
                                        EmailListGrpoupList: BlocProvider.of<
                                                EmailListGrpoupCubit>(context)
                                            .EmailListGrpoupList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          EmailListGrpoupModel
                                              EmailListGrpoupmodel =
                                              BlocProvider.of<
                                                          EmailListGrpoupCubit>(
                                                      context)
                                                  .EmailListGrpoupList[index];

                                          await BlocProvider.of<
                                                  EmailListGrpoupCubit>(context)
                                              .GetEmailListGrpoupbyid(
                                                  id: EmailListGrpoupmodel.id!)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowEmailListGroupDeatils));
                                        },
                                        doEdit: (int index) {
                                          EmailListGrpoupModel
                                              EmailListGrpoupmodel =
                                              BlocProvider.of<
                                                          EmailListGrpoupCubit>(
                                                      context)
                                                  .EmailListGrpoupList[index];
                                          BlocProvider.of<EmailListGrpoupCubit>(
                                                  context)
                                              .EditEmailListGrpoup(
                                                  EmailListGrpoupmodel);
                                          context.goNamed(
                                              SubPagesPath.AddEmailListGroup,
                                              extra: {'isAdd': false});
                                        },
                                        doRemove: (int index) {
                                          EmailListGrpoupModel
                                              EmailListGrpoupmodel =
                                              BlocProvider.of<
                                                          EmailListGrpoupCubit>(
                                                      context)
                                                  .EmailListGrpoupList[index];
                                          BlocProvider.of<EmailListGrpoupCubit>(
                                                  context)
                                              .RemoveEmailListGrpoup(
                                                  EmailListGrpoupId:
                                                      EmailListGrpoupmodel.id!,
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
                                            columnName: 'Groupname',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
                                            label: GridHeader(
                                              title: 'Groupname',
                                            )),
                                        GridColumn(
                                            columnName: 'ShowDeatils',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
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
