import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'first_load_state.dart';

class FirstLoadCubit extends Cubit<FirstLoadState> {
  final FirstLoadState firstLoadState;
  FirstLoadCubit({required this.firstLoadState}) : super(firstLoadState);

  void setUserInPreference() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("isOldUser", true);
    emit(const FirstLoadState(isOldUser: true));
  }

  void getUserFromPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isOldUser = sharedPreferences.getBool("isOldUser") ?? false;
    emit(FirstLoadState(isOldUser: isOldUser));
  }
}
