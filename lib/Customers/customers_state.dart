part of 'customers_cubit.dart';

@immutable
abstract class CustomersState {}

class CustomersInitial extends CustomersState {}
class CustomersLoading extends CustomersState {}
class CustomersSucess extends CustomersState {}
class CustomersFail extends CustomersState {}
class GetCustomersByIdLoading extends CustomersState {}
class GetCustomersByIdSucess extends CustomersState {}
class GetCustomersByIdFail extends CustomersState {}
class selectedOptionforGenderState extends CustomersState {}
class selectedOptionForAccountState extends CustomersState {}
class EditCustomersstate extends CustomersState {}
class RemoveDataState extends CustomersState {}
class UploadImage extends CustomersState {}
