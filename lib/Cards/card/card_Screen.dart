import 'package:afcooadminpanel/Cards/card/cardModel.dart';
import 'package:afcooadminpanel/Cards/card/card_DataSource.dart';
import 'package:afcooadminpanel/Cards/card/card_cubit.dart';
import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CardScreen extends StatelessWidget {
  CardScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardCubit, CardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
            // appBar:MyAppBar(),
              body: state is CardLoading
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
                    title: 'Card',
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
                                    // BlocProvider.of<CardCubit>(context)
                                    //     .GetallCardPartner(Cardid: 9);
                                    // context.go('/editPartnerPath');
                                  },
                                  title: 'Add Card',
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
                                source: CardDataSource(
                                  CardList:
                                  BlocProvider.of<CardCubit>(
                                      context)
                                      .CardList,
                                  context: context,
                                  doShowDetails: (int index) async {
                                    CardModel Cardmodel =
                                    BlocProvider.of<CardCubit>(
                                        context)
                                        .CardList[index];

                                    await BlocProvider.of<CardCubit>(
                                        context)
                                        .GetCardbyid(
                                        id: Cardmodel.id)
                                        .then((value) =>
                                      context.goNamed(SubPagesPath.ShowCardDeatils));
                                  },
                                  doEdit: (int index) {},
                                  doRemove: (int index) {
                                    CardModel Cardmodel =
                                    BlocProvider.of<CardCubit>(
                                        context)
                                        .CardList[index];
                                    BlocProvider.of<CardCubit>(context)
                                        .RemoveCard(
                                        CardId: Cardmodel.id,
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
                                      columnName: 'name in English',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .14,
                                      label: GridHeader(
                                        title: 'name in English',
                                      )),
                                  GridColumn(
                                      visible: true,
                                      columnName: 'code',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .03,
                                      label: GridHeader(
                                        title: 'code',
                                      )),
                                  GridColumn(
                                      columnName: 'image',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .08,
                                      label: GridHeader(
                                        title: 'Image',
                                      )),
                                  GridColumn(
                                      columnName: 'CardImage',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .08,
                                      label: GridHeader(
                                        title: 'CardImage',
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
