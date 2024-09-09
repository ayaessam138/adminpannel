part of 'branches_cubit.dart';

@immutable
abstract class BranchesState {}

class BranchesInitial extends BranchesState {}
class BranchesLoading extends BranchesState {}
class BranchesSucess extends BranchesState {}
class GetBranchesByIdLoading extends BranchesState {}
class GetBranchesByIdSucess extends BranchesState {}
class GetBranchesByIdFail extends BranchesState {}
class RemoveBranchesLoading extends BranchesState {}
class RemoveBranchesSucess extends BranchesState {}
class RemoveBranchesFail extends BranchesState {}
class BranchesFail extends BranchesState {}


