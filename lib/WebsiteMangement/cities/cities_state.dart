part of 'cities_cubit.dart';

@immutable
abstract class CitiesState {}

class CitiesInitial extends CitiesState {}
class GetCitiesLoading extends CitiesState {}
class GetCitiesFail extends CitiesState {}
class GetCitiesSucess extends CitiesState {}
class GetCitiesPartnerLoading extends CitiesState {}
class GetCitiesPartnerFail extends CitiesState {}
class GetCitiesPartnerSucess extends CitiesState {}
class GetCityByIdLoading extends CitiesState {}
class GetCityByIdSucess extends CitiesState {}
class GetCityByIdFail extends CitiesState {}
class RemoveCityLoading extends CitiesState {}
class RemoveCitySucess extends CitiesState {}
class RemoveCityFail extends CitiesState {}
class AddCitySucess extends CitiesState {}
class AddCityFail extends CitiesState {}
class AddCityLoading extends CitiesState {}
class SelectOption extends CitiesState {}
class SaveItemOrderCounter extends CitiesState {}
class IncItemOrderCounter extends CitiesState {}
class DecItemOrderCounter extends CitiesState {}
class EditCitystate extends CitiesState {}
class RemoveDataState extends CitiesState {}

class StateChanged extends CitiesState {}