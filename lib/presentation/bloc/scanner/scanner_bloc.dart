import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  ScannerBloc()
      : super(const ScannerState(
          isFlashOn: false,
          isCameraBack: true,
        )) {
    on<QrViewCreated>(_onQRViewCreated);
    on<ChangeCamera>(_onChangeCamera);
    on<ChangeFlash>(_onChangeFlash);
  }

  Future<void> _onQRViewCreated(
      QrViewCreated event, Emitter<ScannerState> emit) async {
    this.controller = event.controller;
    event.controller.scannedDataStream.listen((Barcode scanData) {
      print('oo == $scanData');
      // setState(() {
      //   result = scanData;
      // });
      emit(state.copyWith(result: scanData));
    }).onError((handleError) {
      print('oo == ${handleError.toString()}');

      // setState(() {
      //   defaultVal = handleError.toString();
      // });
    });
    print('ato zan');
  }

  Future<void> _onChangeCamera(
      ChangeCamera event, Emitter<ScannerState> emit) async {
    await controller!.flipCamera();
    emit(state.copyWith(isCameraBack: !this.state.isCameraBack));
  }

  Future<void> _onChangeFlash(
      ChangeFlash event, Emitter<ScannerState> emit) async {
    await controller!.toggleFlash();
    emit(state.copyWith(isFlashOn: !this.state.isFlashOn));
  }

  // @override
  // Future<void> reassemble() async {
  //   // controller?.dispose();
  //   super.noSuchMethod(reassemble());
  //   if (PlatformType.android()) {
  //     controller!.pauseCamera();
  //   } else if (PlatformType.ios()) {
  //     controller!.resumeCamera();
  //   }
  // }

  @override
  Future<void> close() async {
    controller?.dispose();
    super.close();
  }
}
