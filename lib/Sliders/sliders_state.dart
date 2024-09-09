part of 'sliders_cubit.dart';

@immutable
abstract class SlidersState {}

class SlidersInitial extends SlidersState {}
class SlidersLoading extends SlidersState {}
class SlidersSucess extends SlidersState {}
class SlidersFail extends SlidersState {}
class GetSliderByIdLoading extends SlidersState {}
class GetSliderByIdSucess extends SlidersState {}
class GetSliderByIdFail extends SlidersState {}
class RemoveSliderLoading extends SlidersState {}
class RemoveSliderSucess extends SlidersState {}
class AddSliderLoading extends SlidersState {}
class AddSliderSucess extends SlidersState {}
class AddSliderFail extends SlidersState {}
class SelectOption extends SlidersState {}
class UploadImage extends SlidersState {}
class EditSlidersstate extends SlidersState {}
class RemoveDataState extends SlidersState {}
class RemoveSliderFail extends SlidersState {}
