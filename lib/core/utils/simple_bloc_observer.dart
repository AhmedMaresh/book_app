import 'dart:nativewrappers/_internal/vm/lib/developer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    log(change.toString());
    super.onChange(bloc, change);
  }
}
