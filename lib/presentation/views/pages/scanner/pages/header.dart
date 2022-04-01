import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/core/constants/colors.dart';
import 'package:qr_scanner/core/utils/size_utils.dart';
import 'package:qr_scanner/presentation/bloc/bloc/default_bloc.dart';
import 'package:qr_scanner/presentation/themes/app_theme.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DefaultBloc, DefaultState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          width: SizeUtils.fullWidth(context),
          height: SizeUtils.fullHeight(context),
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'QR Scanner',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: ThemeColors.white,
                    ),
              ),
              IconButton(
                onPressed: () {
                  context.read<DefaultBloc>().add(
                        ChangeTheme(
                          theme: state.theme == AppTheme.light
                              ? AppTheme.dark
                              : AppTheme.light,
                        ),
                      );
                },
                icon: Icon(
                  state.theme == AppTheme.light ? Icons.dark_mode : Icons.sunny,
                  color: ThemeColors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
