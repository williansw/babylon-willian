import 'package:babylon/app/common/extension/widget_extensions.dart';
import 'package:flutter/material.dart';
import '../../../common/ui/components/components.dart';
import '../../../core/constants/languages/resources.dart';
import '../../../core/style/styte.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(viewModel: viewModel, body: body);
  }

  Widget get body => Container(
    padding: EdgeInsets.symmetric(vertical: Spacing.x3),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [title, loginButton],
    ).centered,
  );

  Widget get title => Text(
    R.welcomeToBabylon,
    style: AppTextStyle.styleBase.copyWith(fontSize: 25).style,
  );

  Widget get loginButton => Column(
    children: [
      CustomButton(
        text: R.loginButton,
        width: double.infinity,
        margin: EdgeInsets.zero,
        isLoading: viewModel.isLoading,
        onPressed: () => {},
      ),
    ],
  );
}
