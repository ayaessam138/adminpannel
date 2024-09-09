part of 'service_cubit.dart';

@immutable
abstract class ServiceState {}

class ServiceInitial extends ServiceState {}
class GetServicePartnerSucess extends ServiceState {}
class GetServicePartnerLoading  extends ServiceState {}
class GetServicePartnerFail   extends ServiceState {}
class GetServiceSucess extends ServiceState {}
class GetServiceLoading  extends ServiceState {}
class GetServiceFail   extends ServiceState {}
class GetServiceByIdLoading   extends ServiceState {}
class GetServiceByIdSucess   extends ServiceState {}
class GetServiceByIdFail   extends ServiceState {}
class RemoveServiceLoading   extends ServiceState {}
class RemoveServiceSucess  extends ServiceState {}
class RemoveServiceFail  extends ServiceState {}
class SaveDiscountPercentageCounter  extends ServiceState {}
class IncDiscountPercentageCounter  extends ServiceState {}
class DecDiscountPercentageCounter  extends ServiceState {}
class StateChanged   extends ServiceState {}
