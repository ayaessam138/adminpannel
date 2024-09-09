import 'package:afcooadminpanel/ContactUs/ContactUs_Model.dart';
import 'package:afcooadminpanel/ContactUs/contactUs_DataSource.dart';
import 'package:afcooadminpanel/ContactUs/contact_us_cubit.dart';
import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ContactUscreen extends StatelessWidget {
  ContactUscreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsCubit, ContactUsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
            // appBar:MyAppBar(),
              body: state is ContactUsLoading
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
                    title: 'ContactUs',
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
                                    // BlocProvider.of<SliderCubit>(context)
                                    //     .GetallSliderPartner(Sliderid: 9);
                                    // context.go('/editPartnerPath');
                                  },
                                  title: 'Add ContactUs',
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
                                source: ContactUsDataSource(
                                  ContactUsList:
                                  BlocProvider.of<ContactUsCubit>(
                                      context)
                                      .ContactUsList,
                                  context: context,
                                  doShowDetails: (int index) async {
                                    ContactUsModel ContactUsmodel =
                                    BlocProvider.of<ContactUsCubit>(
                                        context)
                                        .ContactUsList[index];

                                    await BlocProvider.of<ContactUsCubit>(
                                        context)
                                        .GetContactUsbyid(
                                        id: ContactUsmodel.id)
                                        .then((value) =>
                                      context..goNamed(SubPagesPath.ShowContactUsDeatils));
                                  },

                                  doRemove: (int index) {
                                    ContactUsModel ContactUsmodel =
                                    BlocProvider.of<ContactUsCubit>(
                                        context)
                                        .ContactUsList[index];

                                    BlocProvider.of<ContactUsCubit>(context)
                                        .RemoveContactUs(
                                        ContactUsId: ContactUsmodel.id,
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
                                      visible: true,
                                      columnName: 'city',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .03,
                                      label: GridHeader(
                                        title: 'city',
                                      )),
                                  GridColumn(
                                      columnName: 'Cerated At',
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          .08,
                                      label: GridHeader(
                                        title: 'Cerated At',
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
