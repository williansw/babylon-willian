import 'package:babylon/app/core/common/extension/string_extensions.dart';
import 'package:babylon/app/core/common/extension/widget_extensions.dart';
import 'package:babylon/app/core/common/ui/components/widgets/text/app_name.dart';
import 'package:flutter/material.dart';

import '../../../core/common/ui/components/components.dart';
import '../../../core/common/ui/components/widgets/base/language_selector.dart';
import '../../../core/common/ui/components/widgets/image/app_logo.dart';
import '../../../core/constants/languages/resources.dart';
import '../../../core/style/styte.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: viewModel.scaffoldKey,
      showDrawer: true,
      floatingActionButton: drawerButton,
      viewModel: viewModel,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: AppName(fontSize: 25),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [LanguageSelector()],
          ),
        ],
      ),
      body: body,
    );
  }

  Widget get body => Container(
    padding: EdgeInsets.symmetric(vertical: Spacing.x3),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [title],
    ).centered,
  );

  Widget get logo => AppLogoIcon(size: Spacing.x10);

  Widget get title => CustomText.translated(
    () => R.hiUser(viewModel.user?.name?.capitalizeWords ?? ''),
    textAlign: TextAlign.center,
    style: AppTextStyle.styleBase.copyWith(fontSize: 35),
  );

  Widget get drawerButton => FloatingActionButton(
    onPressed: () => viewModel.openDrawer(),
    backgroundColor: AppColor.secondary,
    child: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () => viewModel.openDrawer(),
    ),
  );
}
