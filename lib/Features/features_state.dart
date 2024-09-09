part of 'features_cubit.dart';

@immutable
abstract class FeaturesState {}

class FeaturesInitial extends FeaturesState {}
class FeaturesLoading extends FeaturesState {}
class FeaturesSucess extends FeaturesState {}
class FeaturesFail extends FeaturesState {}
class GetFeaturesByIdLoading extends FeaturesState {}
class GetFeaturesByIdSucess extends FeaturesState {}
class GetFeaturesByIdFail extends FeaturesState {}
class RemoveFeaturesLoading extends FeaturesState {}
class RemoveFeaturesSucess extends FeaturesState {}
class AddFeaturesLoading extends FeaturesState {}
class AddFeaturesSucess extends FeaturesState {}
class AddFeaturesFail extends FeaturesState {}
class SelectOption extends FeaturesState {}
class EditFeaturesstate extends FeaturesState {}
class RemoveDataState extends FeaturesState {}
class UploadImage extends FeaturesState {}
class RemoveFeaturesFail extends FeaturesState {}
