part of 'default_bloc.dart';

class DefaultState extends Equatable {
  final AppTheme theme;
  final bool status;

  const DefaultState({required this.theme, required this.status});

  @override
  List<Object> get props => [theme, status];

  DefaultState copyWith({
    AppTheme? theme,
    bool? status,
  }) {
    return DefaultState(
      theme: theme ?? this.theme,
      status: status ?? this.status,
    );
  }
}
