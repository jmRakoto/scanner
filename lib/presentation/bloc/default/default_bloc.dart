import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_scanner/presentation/themes/app_theme.dart';

part 'default_event.dart';
part 'default_state.dart';

class DefaultBloc extends Bloc<DefaultEvent, DefaultState> {
  DefaultBloc()
      : super(
          const DefaultState(
            theme: AppTheme.light,
            status: false,
          ),
        ) {
    on<ChangeTheme>(_onChangeTheme);
    on<Splash>(_onSplash);
  }

  Future<void> _onChangeTheme(
      ChangeTheme event, Emitter<DefaultState> emit) async {
    emit(state.copyWith(theme: event.theme));
  }

  Future<void> _onSplash(Splash event, Emitter<DefaultState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: true));
  }
}
