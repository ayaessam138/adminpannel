import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/commnQuestions/CommnQuestions_datasource.dart';
import 'package:afcooadminpanel/commnQuestions/commnQuestionsModel.dart';
import 'package:afcooadminpanel/commnQuestions/commn_questions_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CommnQuestionsScreen extends StatelessWidget {
  CommnQuestionsScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommnQuestionsCubit, CommnQuestionsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is CommnQuestionsLoading
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
                          title: 'CommnQuestions',
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
                                              SubPagesPath.AddCommnQuestions);
                                        },
                                        title: 'Add CommnQuestions',
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
                                      source: CommnQuestionsDataSource(
                                        CommnQuestionsList: BlocProvider.of<
                                                CommnQuestionsCubit>(context)
                                            .CommnQuestionsList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          CommnQuestionsModel
                                              CommnQuestionsmodel = BlocProvider
                                                      .of<CommnQuestionsCubit>(
                                                          context)
                                                  .CommnQuestionsList[index];

                                          await BlocProvider.of<
                                                  CommnQuestionsCubit>(context)
                                              .GetCommnQuestionsbyid(
                                                  id: CommnQuestionsmodel.id)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowCommnQuestionsDeatils));
                                        },
                                        doEdit: (int index) {
                                          CommnQuestionsModel
                                              CommnQuestionsmodel = BlocProvider
                                                      .of<CommnQuestionsCubit>(
                                                          context)
                                                  .CommnQuestionsList[index];
                                          BlocProvider.of<CommnQuestionsCubit>(
                                                  context)
                                              .EditCommnQuestions(
                                                  CommnQuestionsmodel);

                                          context.goNamed(
                                              SubPagesPath.AddCommnQuestions,
                                              extra: {'isAdd': false});
                                        },
                                        doRemove: (int index) {
                                          CommnQuestionsModel
                                              CommnQuestionsmodel = BlocProvider
                                                      .of<CommnQuestionsCubit>(
                                                          context)
                                                  .CommnQuestionsList[index];
                                          BlocProvider.of<CommnQuestionsCubit>(
                                                  context)
                                              .RemoveCommnQuestions(
                                                  CommnQuestionsId:
                                                      CommnQuestionsmodel.id,
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
