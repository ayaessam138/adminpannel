import 'package:afcooadminpanel/Banners/bannersModel.dart';
import 'package:afcooadminpanel/Banners/banners_cubit.dart';
import 'package:afcooadminpanel/Banners/banners_datasource.dart';
import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Bannerscreen extends StatelessWidget {
  Bannerscreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannersCubit, BannersState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is BannersLoading
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
                          title: 'Banners',
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
                                              .goNamed(SubPagesPath.AddBanners);
                                        },
                                        title: 'Add Banner',
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
                                      source: BannersDataSource(
                                        BannersList:
                                            BlocProvider.of<BannersCubit>(
                                                    context)
                                                .BannersList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          BannersModel Bannersmodel =
                                              BlocProvider.of<BannersCubit>(
                                                      context)
                                                  .BannersList[index];

                                          await BlocProvider.of<BannersCubit>(
                                                  context)
                                              .GetBannersbyid(
                                                  id: Bannersmodel.id)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowBannersDeatils));
                                        },
                                        doEdit: (int index) {
                                          BannersModel Bannersmodel =
                                              BlocProvider.of<BannersCubit>(
                                                      context)
                                                  .BannersList[index];
                                          BlocProvider.of<BannersCubit>(context)
                                              .EditBanners(Bannersmodel);
                                          context.goNamed(
                                              SubPagesPath.AddBanners,
                                              extra: {'isAdd': false});
                                        },
                                        doRemove: (int index) {
                                          BannersModel Bannersmodel =
                                              BlocProvider.of<BannersCubit>(
                                                      context)
                                                  .BannersList[index];
                                          BlocProvider.of<BannersCubit>(context)
                                              .RemoveBanners(
                                                  BannersId: Bannersmodel.id,
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
                                            visible: true,
                                            columnName: 'Url',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .03,
                                            label: GridHeader(
                                              title: 'Url',
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
                                            columnName: 'status',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'status',
                                            )),
                                        GridColumn(
                                            columnName: 'ShowinWebSite',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'ShowinWebSite',
                                            )),
                                        GridColumn(
                                            columnName: 'ShowinApp',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            label: GridHeader(
                                              title: 'ShowinApp',
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
