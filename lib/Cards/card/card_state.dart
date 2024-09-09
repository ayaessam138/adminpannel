part of 'card_cubit.dart';

@immutable
abstract class CardState {}

class CardInitial extends CardState {}
class CardLoading extends CardState {}
class CardSucess extends CardState {}
class CardFail extends CardState {}
class GetCardByIdLoading extends CardState {}
class GetCardByIdSucess extends CardState {}
class GetCardByIdFail extends CardState {}
class RemoveCardLoading extends CardState {}
class RemoveCardSucess extends CardState {}
class Getdata extends CardState {}
class RemoveCardFail extends CardState {}
