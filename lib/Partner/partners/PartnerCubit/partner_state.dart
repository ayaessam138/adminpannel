part of 'partner_cubit.dart';

@immutable
abstract class PartnerState {}

class PartnerInitial extends PartnerState {}
class GetPartnerLoading extends PartnerState {}
class GetPartnerFail extends PartnerState {}
class GetPartnerSucess extends PartnerState {}

class GetPartnerByIdLoading extends PartnerState {}
class GetPartnerByIdFail extends PartnerState {}
class GetPartnerByIdSucess extends PartnerState {}
class RemovePartnerLoading extends PartnerState {}
class RemovePartnerFail extends PartnerState {}
class RemovePartnerSucess extends PartnerState {}
class AddPartnerLoading extends PartnerState {}
class AddPartnerFail extends PartnerState {}
class AddPartnerSucess extends PartnerState {}
class UploadImage extends PartnerState {}
class RemoveDataState extends PartnerState {}
class EditPartnerstate extends PartnerState {}

class StateChanged extends PartnerState {}
class jion extends PartnerState {}