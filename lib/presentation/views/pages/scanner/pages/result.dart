import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/core/services/service.dart';
import 'package:qr_scanner/core/utils/size_utils.dart';
import 'package:qr_scanner/presentation/bloc/scanner/scanner_bloc.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerBloc, ScannerState>(
      builder: (context, state) {
        return state.result != null
            ? Column(
                children: [
                  Text(
                    'Type',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizeUtils.verticalSpace(10),
                  Text(
                    describeEnum(state.result!.format),
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
                  Services.isUrl(state.result?.code ?? '')
                      ? GestureDetector(
                          onTap: () =>
                              Services.launchURL(state.result?.code ?? ''),
                          child: Text(
                            '${state.result!.code}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        )
                      : Text(
                          '${state.result?.code}',
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                ],
              )
            : Text('');
      },
    );
  }
}
