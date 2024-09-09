part of 'discount_code_cubit.dart';

@immutable
abstract class DiscountCodeState {}

class DiscountCodeInitial extends DiscountCodeState {}
class DisCountCodeLoading extends DiscountCodeState {}
class DisCountCodeSucess extends DiscountCodeState {}
class DisCountCodeFail extends DiscountCodeState {}
class GetDiscountCodeByIdLoading extends DiscountCodeState {}
class GetDiscountCodeByIdSucess extends DiscountCodeState {}
class GetDiscountCodeByIdFail extends DiscountCodeState {}
class RemoveDiscountCodeLoading extends DiscountCodeState {}
class RemoveDiscountCodeSucess extends DiscountCodeState {}
class AddDisCountCodeLoading extends DiscountCodeState {}
class AddDisCountCodeFail extends DiscountCodeState {}
class AddDisCountCodeSucess extends DiscountCodeState {}
class SelectOption extends DiscountCodeState {}
class PickDate extends DiscountCodeState {}
class RemoveDiscountCodeFail extends DiscountCodeState {}
