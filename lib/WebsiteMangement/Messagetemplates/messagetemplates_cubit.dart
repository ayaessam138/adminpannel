import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/WebsiteMangement/Messagetemplates/messageTemplatesModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'messagetemplates_state.dart';

class MessagetemplatesCubit extends Cubit<MessagetemplatesState> {
  MessagetemplatesCubit() : super(MessagetemplatesInitial());
  List <MessagetemplateModel> MessagetemplateList=[];
  void GetallMessagetemplate() {
    emit(Messagetemplateloading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallMessagetemplate');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(MessagetemplateFail());
      } else {
        MessagetemplateList = List.of(data).map((e) => MessagetemplateModel.fromJson(e)).toList();
        Utility.myPrintX(MessagetemplateList.length);
        emit(MessagetemplateSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallMessagetemplateEror');
      Utility.myPrintX(onError.toString());

      emit(MessagetemplateFail());
      // throw onError;
    });
  }

  MessagetemplateModel MessagetemplatebyIdModel =
 MessagetemplateModel(id: 0, name: '', nameEn: '', emailMessagetitle: '', emailMessagetitle_En: '');
  Map<String, dynamic> Messagetemplatedata = {};
  Future<void> GetMessagetemplatebyid({required int id}) async {
    emit(GetMessagetemplateByIdLoading());
    await DioHelper.getData(
        url: "Messagetemplate/GetById",
        qurey: {'id': id}).then((value) {
      Utility.myPrintX('GetMessagetemplatebyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Messagetemplatedata = value.data['data'];
      Utility.myPrintX(Messagetemplatedata);
      if (value.data['statusCode'] != 200) {
        emit(GetMessagetemplateByIdFail());
      } else {
        MessagetemplatebyIdModel =
            MessagetemplateModel.fromJson(Messagetemplatedata);

        emit(GetMessagetemplateByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetMessagetemplatebyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetMessagetemplateByIdFail());
      throw onError;
    });
  }
}
