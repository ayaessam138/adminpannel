import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  int currentIndex = 0;
  void Navigation({required int index}) {
    currentIndex = index;
    emit(Navigationstate());
  }
}
