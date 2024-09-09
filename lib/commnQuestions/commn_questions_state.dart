part of 'commn_questions_cubit.dart';

@immutable
abstract class CommnQuestionsState {}

class CommnQuestionsInitial extends CommnQuestionsState {}
class CommnQuestionsLoading extends CommnQuestionsState {}
class CommnQuestionsSucess extends CommnQuestionsState {}
class CommnQuestionsFail extends CommnQuestionsState {}
class GetCommnQuestionsByIdLoading extends CommnQuestionsState {}
class GetCommnQuestionsByIdSucess extends CommnQuestionsState {}
class GetCommnQuestionsByIdFail extends CommnQuestionsState {}
class RemoveCommnQuestionsLoading extends CommnQuestionsState {}
class RemoveCommnQuestionsSucess extends CommnQuestionsState {}
class SelectOption extends CommnQuestionsState {}
class AddCommnQuestionsLoading extends CommnQuestionsState {}
class AddCommnQuestionsSucess extends CommnQuestionsState {}
class AddCommnQuestionsFail extends CommnQuestionsState {}
class RemoveDataState extends CommnQuestionsState {}
class EditCommnQuestionsstate extends CommnQuestionsState {}
class RemoveCommnQuestionsFail extends CommnQuestionsState {}
