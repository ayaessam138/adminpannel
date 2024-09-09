part of 'offers_cubit.dart';

@immutable
abstract class OffersState {}

class OffersInitial extends OffersState {}
class OffersLoading extends OffersState {}
class OffersSucess extends OffersState {}
class OffersFail extends OffersState {}
class RemoveofferLoading extends OffersState {}
class RemoveofferSucess extends OffersState {}
class GetOfferByIdLoading extends OffersState {}
class GetOfferByIdSucess extends OffersState {}
class GetOfferByIdFail extends OffersState {}
class AddOfferLoading extends OffersState {}
class AddOfferSucess extends OffersState {}
class AddOfferFail extends OffersState {}
class SelectOption extends OffersState {}
class UploadImage extends OffersState {}
class Editoffferstate extends OffersState {}
class RemoveDataState extends OffersState {}
class RemoveofferFail extends OffersState {}
