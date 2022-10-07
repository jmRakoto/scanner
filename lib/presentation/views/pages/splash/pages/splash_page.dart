import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/core/constants/colors.dart';
import 'package:qr_scanner/core/utils/navigation.dart';
import 'package:qr_scanner/presentation/bloc/default/default_bloc.dart';
import 'package:qr_scanner/presentation/routes/route.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<DefaultBloc, DefaultState>(
          listener: (context, state) {
            if (state.status) navigateToAndRemplace(context, Routes.home);
          },
          builder: (context, state) {
            return Container(
              color: ThemeColors.main,
              child: Center(
                child: Image.asset('assets/logo.png'),
              ),
            );
          },
        ),
      ),
    );
  }
}
