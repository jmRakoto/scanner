import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner/core/services/service.dart';
import 'package:qr_scanner/core/utils/platform.dart';
import 'package:qr_scanner/core/utils/size_utils.dart';
import 'package:qr_scanner/presentation/bloc/bloc/default_bloc.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  String defaultVal = '';
  QRViewController? controller;
  bool flashOff = false;

  @override
  void reassemble() {
    super.reassemble();
    if (PlatformType.android()) {
      controller!.pauseCamera();
    } else if (PlatformType.ios()) {
      controller!.resumeCamera();
    }
  }

  void flashMode() async {
    await controller!.toggleFlash();
    setState(() {
      flashOff = !flashOff;
    });
  }

  void cameraType() async {
    await controller!.flipCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((Barcode scanData) {
      setState(() {
        result = scanData;
      });
    }).onError((handleError) {
      setState(() {
        defaultVal = handleError.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DefaultBloc, DefaultState>(
      builder: (context, state) {
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
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderWidth: 10,
                        borderColor: Colors.black,
                        borderLength: 20,
                        borderRadius: 10,
                        overlayColor: Theme.of(context).secondaryHeaderColor,
                      ),
                    )),
                SizeUtils.verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => cameraType(),
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 35,
                      ),
                    ),
                    SizeUtils.horizontalSpace(15),
                    IconButton(
                      onPressed: () => flashMode(),
                      icon: Icon(
                        flashOff == false
                            ? Icons.flashlight_off_outlined
                            : Icons.flashlight_on_outlined,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                SizeUtils.verticalSpace(35),
                result != null
                    ? Column(
                        children: [
                          Text(
                            'Type',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizeUtils.verticalSpace(10),
                          Text(
                            describeEnum(result!.format),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizeUtils.verticalSpace(20),
                          Text(
                            'Value',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          SizeUtils.verticalSpace(10),
                          Services.isUrl(result?.code ?? '')
                              ? GestureDetector(
                                  onTap: () =>
                                      Services.launchURL(result?.code ?? ''),
                                  child: Text(
                                    '${result!.code}',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                )
                              : Text(
                                  '${result!.code}',
                                  style: Theme.of(context).textTheme.bodyText2,
                                )
                        ],
                      )
                    : Text(defaultVal),
              ],
            ));
      },
    );
  }
}
