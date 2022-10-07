import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/core/utils/size_utils.dart';
import 'package:qr_scanner/presentation/bloc/scanner/scanner_bloc.dart';

class ButtonContol extends StatelessWidget {
  const ButtonContol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
      builder: (context, state) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    context.read<ScannerBloc>().add(ChangeCamera()),
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 35,
                ),
              ),
              SizeUtils.horizontalSpace(15),
              IconButton(
                onPressed: () => context.read<ScannerBloc>().add(ChangeFlash()),
                icon: Icon(
                  state.isFlashOn == false
                      ? Icons.flashlight_off_outlined
                      : Icons.flashlight_on_outlined,
                  size: 35,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
