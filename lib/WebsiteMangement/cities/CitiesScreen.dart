import 'dart:ui';

import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/app_bar_widght.dart';
import 'package:afcooadminpanel/Core/layout/Layout.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';

import 'package:afcooadminpanel/WebsiteMangement/cities/cities_cubit.dart';
import 'package:afcooadminpanel/WebsiteMangement/cities/cityModel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'cities_datasource.dart';

class CitiesScreen extends StatelessWidget {
  CitiesScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CitiesCubit, CitiesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is GetCitiesLoading
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
                          title: 'Cities',
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
                                          context.goNamed(SubPagesPath.AddCity);
                                        },
                                        title: 'Add City',
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
                                      source: citiesDataSource(
                                        citiesList:
                                            BlocProvider.of<CitiesCubit>(
                                                    context)
                                                .CityList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          CityModel citymodel =
                                              BlocProvider.of<CitiesCubit>(
                                                      context)
                                                  .CityList[index];

                                          await BlocProvider.of<CitiesCubit>(
                                                  context)
                                              .GetCitybyid(id: citymodel.id)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowCityDeatils));
                                        },
                                        doEdit: (int index) {
                                          CityModel citymodel =
                                              BlocProvider.of<CitiesCubit>(
                                                      context)
                                                  .CityList[index];
                                          BlocProvider.of<CitiesCubit>(context)
                                              .EditCity(citymodel);

                                          context.goNamed(SubPagesPath.AddCity,
                                              extra: {
                                                'isAdd': false,
                                              });
                                        },
                                        doRemove: (int index) {
                                          CityModel cityModel =
                                              BlocProvider.of<CitiesCubit>(
                                                      context)
                                                  .CityList[index];
                                          BlocProvider.of<CitiesCubit>(context)
                                              .RemoveCity(
                                                  CityId: cityModel.id,
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
                                            columnName: 'region',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .14,
                                            label: GridHeader(
                                              title: 'region',
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
                                            columnName: 'sortat',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .11,
                                            label: GridHeader(
                                              title: 'Sort At',
                                            )),
                                        GridColumn(
                                            visible: true,
                                            columnName: 'Show Deatils',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .12,
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
