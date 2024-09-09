part of 'nationnality_cubit.dart';

@immutable
abstract class NationnalityState {}

class NationnalityInitial extends NationnalityState {}
class Nationnalityloading extends NationnalityState {}
class NationnalitySucess extends NationnalityState {}
class NationnalityFail extends NationnalityState {}
class GetNationnalityByIdLoading extends NationnalityState {}
class GetNationnalityByIdSucess extends NationnalityState {}
class GetNationnalityByIdFail extends NationnalityState {}
class RemoveNationnalityLoading extends NationnalityState {}
class RemoveNationnalitySucess extends NationnalityState {}
class SelectOption extends NationnalityState {}
class SaveItemOrderCounter extends NationnalityState {}
class IncItemOrderCounter extends NationnalityState {}
class DecItemOrderCounter extends NationnalityState {}
class EditNationnalitystate extends NationnalityState {}
class RemoveDataState extends NationnalityState {}
class RemoveNationnalityFail extends NationnalityState {}
