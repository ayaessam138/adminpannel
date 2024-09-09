part of 'region_cubit.dart';

@immutable
abstract class RegionState {}

class RegionInitial extends RegionState {}
class GetRegionSucess extends RegionState {}
class GetRegionLoading extends RegionState {}
class GetRegionFail extends RegionState {}
class GetRegionpartnerSucess extends RegionState {}
class GetRegionpartnerLoading extends RegionState {}
class GetRegionpartnerFail extends RegionState {}
class RemoveRegionLoading extends RegionState {}
class RemoveRegionSucess extends RegionState {}
class RemoveRegionFail extends RegionState {}
class GetRegionByIdLoading extends RegionState {}
class GetRegionByIdSucess extends RegionState {}
class GetRegionByIdFail extends RegionState {}
class AddRegionLoading extends RegionState {}
class AddRegionSucess extends RegionState {}
class AddRegionFail extends RegionState {}
class SelectOption extends RegionState {}
class EditRegionState extends RegionState {}
class RemoveDataState extends RegionState {}
class StateChanged extends RegionState {}