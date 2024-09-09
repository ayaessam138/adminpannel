import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/jionUs/jionUsModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'jion_us_state.dart';

class JionUsCubit extends Cubit<JionUsState> {
  JionUsCubit() : super(JionUsInitial());
  List <JionUsModel> JionUsList=[];
  void GetallJionUs() {
    emit(JionUsLoading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallJionUsy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(JionUsFail());
      } else {
        JionUsList = List.of(data).map((e) => JionUsModel.fromJson(e)).toList();
        Utility.myPrintX(JionUsList.length);
        emit(JionUsSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallJionUsyEror');
      Utility.myPrintX(onError.toString());

      emit(JionUsFail());
      // throw onError;
    });
  }

  JionUsModel JionUsbyIdModel =
  JionUsModel(id: 0, name: '', mobile: '', city: '', email: '', status: '');
  Map<String, dynamic> JionUsdata = {};
  Future<void> GetJionUsbyid({required int id}) async {
    emit(GetJionUsByIdLoading());
    await DioHelper.getData(
        url: "JionUs/GetById",
        qurey: {'id': id}).then((value) {
      Utility.myPrintX('GetJionUsbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      JionUsdata = value.data['data'];
      Utility.myPrintX(JionUsdata);
      if (value.data['statusCode'] != 200) {
        emit(GetJionUsByIdFail());
      } else {
        JionUsbyIdModel =
            JionUsModel.fromJson(JionUsdata);

        emit(GetJionUsByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetJionUsbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetJionUsByIdFail());
      throw onError;
    });
  }

  void RemoveJionUs(
      {required int JionUsId, required int index}) {
    emit(RemoveJionUsLoading());

    DioHelper.DeleteData(
        url: 'JionUs/DeleteJionUs',
        qurey: {'id': JionUsId}).then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveJionUs');
      Utility.myPrintX(data);
      if (data['statusCode'] != 204) {
        Utility.myPrintX('RemoveJionUsFail');
        emit(RemoveJionUsFail());
      } else {
        JionUsList.removeAt(index);

        emit(RemoveJionUsSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveJionUs error');
      Utility.myPrintX(onError.toString());
      emit(RemoveJionUsFail());
      // throw onError;
    });
  }
}
