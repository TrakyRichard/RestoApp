import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(const WelcomeState(page: 0));

  void pageChanged(int page) {
    emit(WelcomeState(page: page));
  }
}
