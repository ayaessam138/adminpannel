part of 'banners_cubit.dart';

@immutable
abstract class BannersState {}

class BannersInitial extends BannersState {}
class BannersLoading extends BannersState {}
class BannersSucess extends BannersState {}
class BannersFail extends BannersState {}
class GetBannersByIdLoading extends BannersState {}
class GetBannersByIdSucess extends BannersState {}
class GetBannersByIdFail extends BannersState {}
class RemoveBannersLoading extends BannersState {}
class RemoveBannersSucess extends BannersState {}
class AddBannersLoading extends BannersState {}
class AddBannersSucess extends BannersState {}
class AddBannersFail extends BannersState {}
class SelectOptionforcaseState extends BannersState {}
class SelectOptionforShowinAppState extends BannersState {}
class SelectOptionforShowinWebSitestate extends BannersState {}
class UploadImage extends BannersState {}
class SaveDurationofshowCounter extends BannersState {}
class IncDurationofshowCounter extends BannersState {}
class DecDurationofshowCounter extends BannersState {}
class StateChanged extends BannersState {}
class EditBannersstate extends BannersState {}
class RemoveDataState extends BannersState {}
class RemoveBannersFail extends BannersState {}
