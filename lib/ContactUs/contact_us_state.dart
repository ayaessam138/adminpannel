part of 'contact_us_cubit.dart';

@immutable
abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}
class ContactUsLoading extends ContactUsState {}
class ContactUsSucess extends ContactUsState {}
class ContactUsFail extends ContactUsState {}
class GetContactUsByIdLoading extends ContactUsState {}
class GetContactUsByIdSucess extends ContactUsState {}
class RemoveContactUsLoading extends ContactUsState {}
class RemoveContactUsSucess extends ContactUsState {}
class RemoveContactUsFail extends ContactUsState {}
class GetContactUsByIdFail extends ContactUsState {}
