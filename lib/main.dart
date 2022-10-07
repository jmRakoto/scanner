import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/presentation/bloc/default/default_bloc.dart';
import 'package:qr_scanner/presentation/bloc/scanner/scanner_bloc.dart';
import 'package:qr_scanner/presentation/routes/route.dart';
import 'package:qr_scanner/presentation/themes/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DefaultBloc>(
            create: (context) => DefaultBloc()..add(Splash())),
        BlocProvider<ScannerBloc>(create: (context) => ScannerBloc())
      ],
      child: BlocBuilder<DefaultBloc, DefaultState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'QR Scanner',
            theme: appThemeData[state.theme],
            initialRoute: Routes.splash,
            routes: AppRoute.routes,
          );
        },
      ),
    );
  }
}
