import 'package:afcooadminpanel/Core/AppNavgation.dart';
import 'package:afcooadminpanel/Core/widghts/Button.dart';
import 'package:afcooadminpanel/Core/widghts/TabHeader.dart';
import 'package:afcooadminpanel/Core/widghts/gridHeader.dart';
import 'package:afcooadminpanel/Sliders/SlidersModel.dart';
import 'package:afcooadminpanel/Sliders/sliders_cubit.dart';
import 'package:afcooadminpanel/Sliders/sliders_datasource.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SliderScreen extends StatelessWidget {
  SliderScreen({Key? key}) : super(key: key);
  final GlobalKey<SfDataGridState> gridKey = GlobalKey<SfDataGridState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SlidersCubit, SlidersState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scaffold(
              // appBar:MyAppBar(),
              body: state is SlidersLoading
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
                          title: 'Slider',
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
                                              .goNamed(SubPagesPath.AddSliders);
                                        },
                                        title: 'Add Slider',
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
                                      source: SlidersDataSource(
                                        SlidersList:
                                            BlocProvider.of<SlidersCubit>(
                                                    context)
                                                .SliderList,
                                        context: context,
                                        doShowDetails: (int index) async {
                                          SliderModel Slidermodel =
                                              BlocProvider.of<SlidersCubit>(
                                                      context)
                                                  .SliderList[index];

                                          await BlocProvider.of<SlidersCubit>(
                                                  context)
                                              .GetSliderbyid(id: Slidermodel.id)
                                              .then((value) => context.goNamed(
                                                  SubPagesPath
                                                      .ShowSliderDeatils));
                                        },
                                        doEdit: (int index) {
                                          SliderModel Slidermodel =
                                              BlocProvider.of<SlidersCubit>(
                                                      context)
                                                  .SliderList[index];
                                          BlocProvider.of<SlidersCubit>(context)
                                              .EditSliders(Slidermodel);
                                          context.goNamed(
                                              SubPagesPath.AddSliders,
                                              extra: {'isAdd': false});
                                        },
                                        doRemove: (int index) {
                                          SliderModel Slidermodel =
                                              BlocProvider.of<SlidersCubit>(
                                                      context)
                                                  .SliderList[index];
                                          BlocProvider.of<SlidersCubit>(context)
                                              .RemoveSlider(
                                                  SliderId: Slidermodel.id,
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
