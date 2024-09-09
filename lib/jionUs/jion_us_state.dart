part of 'jion_us_cubit.dart';

@immutable
abstract class JionUsState {}

class JionUsInitial extends JionUsState {}
class JionUsLoading extends JionUsState {}
class JionUsSucess extends JionUsState {}
class JionUsFail extends JionUsState {}
class GetJionUsByIdLoading extends JionUsState {}
class GetJionUsByIdSucess extends JionUsState {}
class GetJionUsByIdFail extends JionUsState {}
class RemoveJionUsLoading extends JionUsState {}
class RemoveJionUsSucess extends JionUsState {}
class RemoveJionUsFail extends JionUsState {}
