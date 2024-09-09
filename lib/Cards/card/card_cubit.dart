import 'package:afcooadminpanel/Cards/card/cardModel.dart';
import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());
  List <CardModel> CardList=[];
  void GetallCard() {
    emit(CardLoading());
    DioHelper.getData(
      url: "Card/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallCard');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(CardFail());
      } else {
        CardList = List.of(data).map((e) => CardModel.fromJson(e)).toList();
        Utility.myPrintX(CardList.length);
        emit(CardSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallCardEror');
      Utility.myPrintX(onError.toString());

      emit(CardFail());
      throw onError;
    });
  }
  CardModel CardbyIdModel =
CardModel(id: 0, cardImage: '', name: '', nameEn: '', code: '', status: 0, image: '');
  Map<String, dynamic> Carddata = {};
  Future<void> GetCardbyid({required int id}) async {
    emit(GetCardByIdLoading());
    await DioHelper.getData(
        url: "Card/GetById",
        qurey: {'id': id}).then((value) {
      Utility.myPrintX('GetCardbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Carddata = value.data['data'];
      Utility.myPrintX(Carddata);
      if (value.data['statusCode'] != 200) {
        emit(GetCardByIdFail());
      } else {
        CardbyIdModel =
            CardModel.fromJson(Carddata);

        emit(GetCardByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetCardbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetCardByIdFail());
      throw onError;
    });
  }

  void RemoveCard(
      {required int CardId, required int index}) {
    emit(RemoveCardLoading());

    DioHelper.DeleteData(
        url: 'Card/DeleteCard',
        qurey: {'id': CardId}).then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveCard');
      Utility.myPrintX(data);
      if (data['statusCode'] != 200) {
        Utility.myPrintX('RemoveCardFail');
        emit(RemoveCardFail());
      } else {
        CardList.removeAt(index);

        emit(RemoveCardSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveCard error');
      Utility.myPrintX(onError.toString());
      emit(RemoveCardFail());
      // throw onError;
    });
  }



}
