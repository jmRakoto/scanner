part of 'default_bloc.dart';

abstract class DefaultEvent extends Equatable {
  const DefaultEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends DefaultEvent {
  final AppTheme theme;

  const ChangeTheme({required this.theme});

  @override
  List<Object> get props => [theme];
}

class Splash extends DefaultEvent {}
