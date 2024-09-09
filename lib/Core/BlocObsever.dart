import 'dart:developer';

import 'package:afcooadminpanel/Core/utility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Utility.myPrintX('Bloc created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Utility.myPrintX('Event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Utility.myPrintX('State changed: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Utility.myPrintX('Error: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Utility.myPrintX('Bloc closed: ${bloc.runtimeType}');
  }
}
