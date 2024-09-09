import 'package:afcooadminpanel/Cards/discountCode/discountCodeModel.dart';
import 'package:afcooadminpanel/Cards/discountCode/discountCode_DataSource.dart';
import 'package:afcooadminpanel/Cards/discountCode/discount_code_cubit.dart';
import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DisCountCodecreen extends StatelessWidget {
  DisCountCodecreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiscountCodeCubit, DiscountCodeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              body: state is DisCountCodeLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.red,
                      ),
                    )
                  : Column(
                      children: [
                        const TabHeader(
                          title: 'DisCountCode',
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
                                              SubPagesPath.AddDisCountCode);
                                        },
                                        title: 'Add DisCountCode',
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
                                      source: DisCountCodeDataSource(
                                        DisCountCodeList:
                                            BlocProvider.of<DiscountCodeCubit>(
                                                    context)
                                                .DisCountCodeList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          DisCountCodeModel DisCountCodemodel =
                                              BlocProvider.of<
                                                          DiscountCodeCubit>(
                                                      context)
                                                  .DisCountCodeList[index];

                                          await BlocProvider.of<
                                                  DiscountCodeCubit>(context)
                                              .GetDiscountCodebyid(
                                                  id: DisCountCodemodel.id)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowDisCountCodeDeatils));
                                        },
                                        doEdit: (int index) {},
                                        doRemove: (int index) {
                                          DisCountCodeModel DisCountCodemodel =
                                              BlocProvider.of<
                                                          DiscountCodeCubit>(
                                                      context)
                                                  .DisCountCodeList[index];
                                          BlocProvider.of<DiscountCodeCubit>(
                                                  context)
                                              .RemoveDiscountCode(
                                                  DiscountCodeId:
                                                      DisCountCodemodel.id,
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
                                                .08,
                                            label: GridHeader(
                                              title: 'name',
                                            )),
                                        GridColumn(
                                            columnName: 'StartDate',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'StartDate',
                                            )),
                                        GridColumn(
                                            columnName: 'EndDate',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
                                            label: GridHeader(
                                              title: 'EndDate',
                                            )),
                                        GridColumn(
                                            visible: true,
                                            columnName: 'DiscountType',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .03,
                                            label: GridHeader(
                                              title: 'DiscountType',
                                            )),
                                        GridColumn(
                                            columnName: 'discountValue',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
                                            label: GridHeader(
                                              title: 'discountValue',
                                            )),
                                        GridColumn(
                                            columnName: 'ShowDeatils',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
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
