part of 'scanner_bloc.dart';

abstract class ScannerEvent extends Equatable {
  const ScannerEvent();

  @override
  List<Object> get props => [];
}

class QrViewCreated extends ScannerEvent {
  final QRViewController controller;

  const QrViewCreated({required this.controller});

  @override
  List<Object> get props => [controller];
}

class ChangeCamera extends ScannerEvent {}

class ChangeFlash extends ScannerEvent {}
