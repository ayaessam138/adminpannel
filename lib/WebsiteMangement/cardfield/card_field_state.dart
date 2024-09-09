part of 'card_field_cubit.dart';

@immutable
abstract class CardFieldState {}

class CardFieldInitial extends CardFieldState {}
class GetCardFieldpartnerFail extends CardFieldState {}
class GetCardFieldpartnerLoading extends CardFieldState {}
class GetCardFieldpartnerSucess extends CardFieldState {}
class GetallCardFieldFail extends CardFieldState {}
class GetallCardFieldLoading extends CardFieldState {}
class GetallCardFieldSucess extends CardFieldState {}
class RemovecardFieldLoading extends CardFieldState {}
class RemovecardFieldSucess extends CardFieldState {}
class RemovecardFieldFail extends CardFieldState {}
class GetcardFieldByIdLoading extends CardFieldState {}
class GetcardFieldByIdSucess extends CardFieldState {}
class GetcardFieldByIdFail extends CardFieldState {}
class AddcardFieldLoading extends CardFieldState {}
class AddcardFieldFail extends CardFieldState {}
class AddcardFieldSucess extends CardFieldState {}
class SelectOption extends CardFieldState {}
class UploadImage extends CardFieldState {}
class SaveItemOrderCounter extends CardFieldState {}
class IncItemOrderCounter extends CardFieldState {}
class DecItemOrderCounter extends CardFieldState {}
class EditCardFieldstate extends CardFieldState {}
class SizeChanged extends CardFieldState {}
class RemoveDataState extends CardFieldState {}
class StateChanged extends CardFieldState {}