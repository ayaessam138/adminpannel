import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/WebsiteMangement/websiteContentMangement/webSiteContentMangement_dataSource.dart';
import 'package:afcooadminpanel/WebsiteMangement/websiteContentMangement/websiteContentMangementModel.dart';
import 'package:afcooadminpanel/WebsiteMangement/websiteContentMangement/website_content_mangement_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class WebsiteContentMangementScreen extends StatelessWidget {
  WebsiteContentMangementScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteContentMangementCubit,
        WebsiteContentMangementState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is WebsiteContentMangementLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.red,
                      ),
                    )
                  : Column(
                      children: [
                        // Row(
                        //   children: [
                        //     CustomButton(
                        //       onTap: () {
                        //
                        //
                        //         context.goNamed(SubPagesPath.AddWebsiteContentMangement);
                        //       },
                        //       title: 'Add Region',
                        //       height:
                        //       MediaQuery.of(context).size.height *
                        //           .06,
                        //       width:
                        //       MediaQuery.of(context).size.width *
                        //           .07,
                        //       textcolor: Colors.white,
                        //       backGroundcolor:
                        //       const Color(0xff095A56),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height:100,child: BreadcrumbScreen()),
                        const TabHeader(
                          title: 'WebSite Mangement',
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
                                      source: WebsiteContentMangementDataSource(
                                        WebsiteContentMangementList: BlocProvider
                                                .of<WebsiteContentMangementCubit>(
                                                    context)
                                            .WebsiteContentMangementList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          WebsiteContentMangementModel
                                              WebsiteContentMangementmodel =
                                              BlocProvider.of<
                                                          WebsiteContentMangementCubit>(
                                                      context)
                                                  .WebsiteContentMangementList[index];

                                          await BlocProvider.of<
                                                      WebsiteContentMangementCubit>(
                                                  context)
                                              .GetWebsiteContentMangementbyid(
                                                  id: WebsiteContentMangementmodel
                                                      .id)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowWebsiteContentMangementDeatils));
                                        },
                                        doEdit: (int index) {
                                          WebsiteContentMangementModel
                                              WebsiteContentMangementmodel =
                                              BlocProvider.of<
                                                          WebsiteContentMangementCubit>(
                                                      context)
                                                  .WebsiteContentMangementList[index];
                                          BlocProvider.of<
                                                      WebsiteContentMangementCubit>(
                                                  context)
                                              .EditWebsiteContentMangement(
                                                  WebsiteContentMangementmodel);
                                        },
                                        // doRemove: (int index) {
                                        //   WebsiteContentMangementModel
                                        //       WebsiteContentMangementmodel =
                                        //       BlocProvider.of<
                                        //                   WebsiteContentMangementCubit>(
                                        //               context)
                                        //           .WebsiteContentMangementList[index];
                                        //   BlocProvider.of<
                                        //               WebsiteContentMangementCubit>(
                                        //           context)
                                        //       .RemoveWebsiteContentMangement(
                                        //           WebsiteContentMangementId:
                                        //               WebsiteContentMangementmodel
                                        //                   .id,
                                        //           index: index);
                                        // },
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
                                            columnName: 'image',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
                                            label: GridHeader(
                                              title: 'image',
                                            )),
                                        GridColumn(
                                            columnName: 'Showinpage',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'Showinpage',
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
