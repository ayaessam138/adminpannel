import 'package:afcooadminpanel/Core/api/dio_helper.dart';
import 'package:afcooadminpanel/Core/utility.dart';
import 'package:afcooadminpanel/Partner/Branches/branchesModel.dart';


import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  BranchesCubit() : super(BranchesInitial());
  List <BranchesModel> BranchesList=[];
  BranchesModel BranchesbyIdModel=BranchesModel(id: 0, partnername: '', name: '', nameEn: '', status: 0, image: '');
  void GetallBranches() {
    emit(BranchesLoading());
    DioHelper.getData(
      url: "City/GetAll",
    ).then((value) {
      Utility.myPrintX('GetallBranchesy');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      List data = value.data['data'];
      Utility.myPrintX(data);
      if (value.data['statusCode'] != 200) {
        emit(BranchesFail());
      } else {
        BranchesList = List.of(data).map((e) => BranchesModel.fromJson(e)).toList();
        Utility.myPrintX(BranchesList.length);
        emit(BranchesSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetallBranchesyEror');
      Utility.myPrintX(onError.toString());

      emit(BranchesFail());
      // throw onError;
    });
  }
  Map<String,dynamic>Branchesdata= {};
  Future<void> GetBranchesbyid({required int id}) async {
    emit(GetBranchesByIdLoading());
    await DioHelper.getData(url: "Branches/GetById", qurey: {'id': id})
        .then((value) {
      Utility.myPrintX('GetBranchesbyid');
      Utility.myPrintX(value.data);
      Utility.myPrintX(value.statusCode);
      Branchesdata = value.data['data'];
      Utility.myPrintX(Branchesdata);
      if (value.data['statusCode'] != 200) {
        emit(GetBranchesByIdFail());
      } else {
        BranchesbyIdModel = BranchesModel.fromJson(Branchesdata);

        emit(GetBranchesByIdSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('GetBranchesbyidEror');
      Utility.myPrintX(onError.toString());

      emit(GetBranchesByIdFail());
      throw onError;
    });
  }
  void RemoveBranches({required int BranchesId, required int index}) {
    emit(RemoveBranchesLoading());

    DioHelper.DeleteData(url: 'Branches/DeleteBranches', qurey: {'id': BranchesId})
        .then((response) {
      Map<String, dynamic> data = response.data;
      Utility.myPrintX('RemoveBranches');
      Utility.myPrintX(data);
      if (data['statusCode'] != 200) {
        Utility.myPrintX('RemoveBranchesFail');
        emit(RemoveBranchesFail());
      } else {
        BranchesList.removeAt(index);

        emit(RemoveBranchesSucess());
      }
    }).catchError((onError) {
      Utility.myPrintX('RemoveBranches error');
      Utility.myPrintX(onError.toString());
      emit(RemoveBranchesFail());
      throw onError;
    });
  }
}


