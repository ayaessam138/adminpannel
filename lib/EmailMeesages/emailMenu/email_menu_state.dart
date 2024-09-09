part of 'email_menu_cubit.dart';

@immutable
abstract class EmailMenuState {}

class EmailMenuInitial extends EmailMenuState {}
class EmailMenuLoading extends EmailMenuState {}
class EmailMenuSucess extends EmailMenuState {}
class EmailMenuFail extends EmailMenuState {}
class GetEmailMenuByIdLoading extends EmailMenuState {}
class GetEmailMenuByIdSucess extends EmailMenuState {}
class GetEmailMenuByIdFail extends EmailMenuState {}
class RemoveEmailMenuLoading extends EmailMenuState {}
class RemoveEmailMenuSucess extends EmailMenuState {}
class RemoveDataState extends EmailMenuState {}
class EditEmailMenustate extends EmailMenuState {}
class AddEmailMenuLoading extends EmailMenuState {}
class AddEmailMenuSucess extends EmailMenuState {}
class AddEmailMenuFail extends EmailMenuState {}
class RemoveEmailMenuFail extends EmailMenuState {}
