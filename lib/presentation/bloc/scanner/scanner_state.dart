part of 'scanner_bloc.dart';

class ScannerState extends Equatable {
  final bool isFlashOn;
  final bool isCameraBack;
  final Barcode? result;

  const ScannerState({
    required this.isFlashOn,
    required this.isCameraBack,
    this.result,
  });

  @override
  List<Object> get props => [isFlashOn, isCameraBack, result!];

  ScannerState copyWith({
    bool? isFlashOn,
    bool? isCameraBack,
    Barcode? result,
  }) {
    return ScannerState(
      isFlashOn: isFlashOn ?? this.isFlashOn,
      isCameraBack: isCameraBack ?? this.isCameraBack,
      result: result ?? this.result,
    );
  }
}
