import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/commnQuestions/commnQuestionsModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'commn_questions_state.dart';

class CommnQuestionsCubit extends Cubit<CommnQuestionsState> {
  CommnQuestionsCubit() : super(CommnQuestionsInitial());

  TextEditingController title = TextEditingController();
  TextEditingController titleEn = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController contentEn = TextEditingController();
  TextEditingController SortAt = TextEditingController();
  List<CommnQuestionsModel> CommnQuestionsList = [];
  void GetallCommnQuestions() {
    emit(CommnQuestionsLoading());
    DioHelper.getData(
      url: "CommnQuestions/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallCommnQuestionsy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(CommnQuestionsFail());
      } else {
        CommnQuestionsList =
            List.of(data).map((e) => CommnQuestionsModel.fromJson(e)).toList();
        Utility.myPrintX(CommnQuestionsList.length);
        emit(CommnQuestionsSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallCommnQuestionsyEror');
      Utility.myPrintX(onError.toString());

      emit(CommnQuestionsFail());
      // throw onError;
    });
  }

  CommnQuestionsModel CommnQuestionsbyIdModel = CommnQuestionsModel(
    id: 0,
    title: '',
    titleEn: '',
    status: 0,
    Content: '',
    ContentEn: '',
    SortAt: 0,
  );
  Map<String, dynamic> CommnQuestionsdata = {};
  Future<void> GetCommnQuestionsbyid({required int id}) async {
    emit(GetCommnQuestionsByIdLoading());
    await DioHelper.getData(url: "CommnQuestions/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetCommnQuestionsbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      CommnQuestionsdata = value.data['data'];
      Utility.myPrintX(CommnQuestionsdata);
      if (value.data['statusCode'] != 200) {
        emit(GetCommnQuestionsByIdFail());
      } else {
        CommnQuestionsbyIdModel =
            CommnQuestionsModel.fromJson(CommnQuestionsdata);

        emit(GetCommnQuestionsByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetCommnQuestionsbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetCommnQuestionsByIdFail());
      throw onError;
    });
  }

  void RemoveCommnQuestions(
      {required int CommnQuestionsId, required int index}) {
    emit(RemoveCommnQuestionsLoading());

    DioHelper.DeleteData(
        url: 'CommnQuestions/DeleteCommnQuestions',
        qurey: {'id': CommnQuestionsId}).then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveCommnQuestions');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemoveCommnQuestionsFail');
        emit(RemoveCommnQuestionsFail());
      } else {
        CommnQuestionsList.removeAt(index);

        emit(RemoveCommnQuestionsSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveCommnQuestions error');
      Utility.myPrintX(onError.toString());
      emit(RemoveCommnQuestionsFail());
      // throw onError;
    });
  }

  Future<void> AddCommnQuestions(
      CommnQuestionsModel commnQuestionsModel) async {
    Utility.myPrintX(CommnQuestionsModel.postToJson(commnQuestionsModel));
    emit(AddCommnQuestionsLoading());
    await DioHelper.postData(
            url: "CommnQuestions/AddUpdate",
            data: CommnQuestionsModel.postToJson(commnQuestionsModel))
        .then((response) {
      Utility.myPrintX(response.data);
      Utility.myPrintX(response.statusCode);
      Map<String, dynamic> CommnQuestionsData = response.data;
      if (CommnQuestionsData["statusCode"] != 200) {
        Utility.myPrintX('Addpartner FAil');

        emit(AddCommnQuestionsFail());
      } else {
        emit(AddCommnQuestionsSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX(onError.toString());
      emit(AddCommnQuestionsFail());
      throw onError;
    });
  }

  String selectedOption = '';
  SelectRadioButton(value) {
    selectedOption = value;
    emit(SelectOption());
  }

  Future<void> EditCommnQuestions(
      CommnQuestionsModel commnQuestionsModel) async {
    title.text = commnQuestionsModel.title ?? '';
    titleEn.text = commnQuestionsModel.titleEn ?? '';
    content.text = commnQuestionsModel.Content ?? '';
    contentEn.text = commnQuestionsModel.ContentEn ?? '';
    SortAt.text = commnQuestionsModel.SortAt.toString() ?? '';
    selectedOption = commnQuestionsModel.status == 1 ? 'Posted' : 'NotPosted';

    emit(EditCommnQuestionsstate());
  }

  Future<void> RemoveData() async {
    title.clear();
    titleEn.clear();
    content.clear();
    contentEn.clear();
    contentEn.clear();
    selectedOption = '';
    emit(RemoveDataState());
  }
}
