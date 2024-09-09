part of 'messagetemplates_cubit.dart';

@immutable
abstract class MessagetemplatesState {}

class MessagetemplatesInitial extends MessagetemplatesState {}
class Messagetemplateloading extends MessagetemplatesState {}
class MessagetemplateSucess extends MessagetemplatesState {}
class MessagetemplateFail extends MessagetemplatesState {}
class GetMessagetemplateByIdLoading extends MessagetemplatesState {}
class GetMessagetemplateByIdSucess extends MessagetemplatesState {}
class GetMessagetemplateByIdFail extends MessagetemplatesState {}
