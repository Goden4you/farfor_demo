import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteConfigCubit extends Cubit<bool> {
  RemoteConfigCubit() : super(false);

  void activate() => emit(true);
}
