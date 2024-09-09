part of 'email_list_grpoup_cubit.dart';

@immutable
abstract class EmailListGrpoupState {}

class EmailListGrpoupInitial extends EmailListGrpoupState {}
class EmailListGrpoupLoading extends EmailListGrpoupState {}
class EmailListGrpoupSucess extends EmailListGrpoupState {}
class EmailListGrpoupFail extends EmailListGrpoupState {}
class GetEmailListGrpoupByIdLoading extends EmailListGrpoupState {}
class GetEmailListGrpoupByIdSucess extends EmailListGrpoupState {}
class GetEmailListGrpoupByIdFail  extends EmailListGrpoupState {}
class RemoveEmailListGrpoupLoading  extends EmailListGrpoupState {}
class RemoveEmailListGrpoupSucess  extends EmailListGrpoupState {}
class AddEmailListGrpoupLoading  extends EmailListGrpoupState {}
class AddEmailListGrpoupSucess  extends EmailListGrpoupState {}
class AddEmailListGrpoupFail  extends EmailListGrpoupState {}
class EditEmailListGrpoupstate  extends EmailListGrpoupState {}
class RemoveDataState  extends EmailListGrpoupState {}
class RemoveEmailListGrpoupFail  extends EmailListGrpoupState {}
