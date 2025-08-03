import 'package:babylon/app/core/common/extension/effects.dart';
import 'package:babylon/app/core/common/extension/widget_extensions.dart';
import 'package:babylon/app/core/common/ui/components/widgets/base/custom_imagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/ui/components/components.dart';
import '../../../core/constants/languages/languages.dart';
import '../../../core/style/styte.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatefulWidget {
  final SplashViewModel viewModel;

  const SplashView({super.key, required this.viewModel});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => widget.viewModel.loadData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashViewModel>(
      builder: (context, viewModel, _) {
        return CustomScaffold(
          viewModel: widget.viewModel,
          padding: EdgeInsets.zero,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAssetImage(
                  height: 160,
                  width: 160,
                  imageName: AppImage.babylonIcon,
                ).pulse(),
                Spacing.x4.spaceV,
                Text(
                  R.appName.toUpperCase(),
                  style: AppTextStyle.displayLarge
                      .copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        color: AppColor.logoGreen,
                        letterSpacing: 1.5,
                      )
                      .style,
                  textAlign: TextAlign.center,
                ),
              ],
            ).padAll(Spacing.x4),
          ),
        );
      },
    );
  }
}
