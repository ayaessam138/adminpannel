part of 'mangers_cubit.dart';

@immutable
abstract class MangersState {}

class MangersInitial extends MangersState {}
class MangersLoading extends MangersState {}
class MangersSucess extends MangersState {}
class MangersFail extends MangersState {}
class GetMangersByIdLoading extends MangersState {}
class GetMangersByIdSucess extends MangersState {}
class GetMangersByIdFail extends MangersState {}
class RemoveMangersLoading extends MangersState {}
class AddMangersLoading extends MangersState {}
class AddMangersFail extends MangersState {}
class AddMangersSucess extends MangersState {}
class RemoveMangersSucess extends MangersState {}
class UploadImage extends MangersState {}
class RemoveDataState extends MangersState {}
class EditMangersstate extends MangersState {}
class RemoveMangersFail extends MangersState {}
class selectedOptionForAccountState extends MangersState {}
class selectedOptionforLanguageState extends MangersState {}
