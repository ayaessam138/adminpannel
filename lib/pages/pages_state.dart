part of 'pages_cubit.dart';

@immutable
abstract class PagesState {}

class PagesInitial extends PagesState {}
class PagesLoading extends PagesState {}
class PagesSucess extends PagesState {}
class PagesFail extends PagesState {}
class GetPagesByIdLoading extends PagesState {}
class GetPagesByIdFail extends PagesState {}
class GetPagesByIdSucess extends PagesState {}
class RemovePagesLoading extends PagesState {}
class RemovePagesSucess extends PagesState {}
class RemovePagesFail extends PagesState {}
class SelectOption extends PagesState {}
class AddPagesLoading extends PagesState {}
class AddPagesFail extends PagesState {}
class AddPagesSucess extends PagesState {}
class EditPagesstate extends PagesState {}
class RemoveDataState extends PagesState {}
class UploadImage extends PagesState {}
