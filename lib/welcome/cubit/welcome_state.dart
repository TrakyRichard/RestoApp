part of 'welcome_cubit.dart';

class WelcomeState extends Equatable {
  final int page;
  const WelcomeState({required this.page});

  @override
  List<Object> get props => [page];
}
