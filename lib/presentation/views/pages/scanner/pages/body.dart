import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner/core/services/service.dart';
import 'package:qr_scanner/core/utils/platform.dart';
import 'package:qr_scanner/core/utils/size_utils.dart';
import 'package:qr_scanner/presentation/bloc/default/default_bloc.dart';
import 'package:qr_scanner/presentation/bloc/scanner/scanner_bloc.dart';
import 'package:qr_scanner/presentation/views/pages/scanner/pages/button_control.dart';
import 'package:qr_scanner/presentation/views/pages/scanner/pages/result.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      height: SizeUtils.fullHeight(context),
      width: SizeUtils.fullWidth(context),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Place the QR code inside the area',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizeUtils.verticalSpace(20),
          Text(
            'Scanning will start automatically',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizeUtils.verticalSpace(60),
          SizedBox(
              height: SizeUtils.fullHeight(context) * 0.3,
              width: SizeUtils.fullWidth(context) * 0.7,
              child: BlocBuilder<ScannerBloc, ScannerState>(
                builder: (context, state) {
                  return QRView(
                    key: qrKey,
                    onQRViewCreated: (QRViewController controller) {
                      context
                          .read<ScannerBloc>()
                          .add(QrViewCreated(controller: controller));
                    },
                    overlay: QrScannerOverlayShape(
                      borderWidth: 10,
                      borderColor: Colors.black,
                      borderLength: 20,
                      borderRadius: 10,
                      overlayColor: Theme.of(context).secondaryHeaderColor,
                    ),
                  );
                },
              )),
          SizeUtils.verticalSpace(20),
          ButtonContol(),
          SizeUtils.verticalSpace(35),
          ResultView()
        ],
      ),
    );
  }
}
