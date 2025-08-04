import 'package:babylon/app/core/common/extension/widget_extensions.dart';
import 'package:babylon/app/core/common/ui/components/widgets/base/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../base/dependences.dart';
import '../../../../core/common/ui/components/widgets/image/app_logo.dart';
import '../../../../core/common/ui/components/widgets/text/app_name.dart';
import '../../../../core/constants/languages/languages.dart';
import '../../../../core/style/styte.dart';
import '../view_model/drawer_view_model.dart';

class AppSidebarDrawer extends StatelessWidget {
  const AppSidebarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<DrawerViewModel>();
    return Drawer(
      backgroundColor: AppColor.background,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(Spacing.x2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: AppLogoIcon(size: Spacing.x4)),
              Center(child: AppName(fontSize: 22, textAlign: TextAlign.center)),
              const Divider(color: AppColor.border),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(Spacing.x2),
                  children: [
                    CustomText.translated(
                      () => R.devName,
                      style: AppTextStyle.styleBase.copyWith(fontSize: 20),
                    ).centered,
                    SizedBox(height: Spacing.x3),
                    CustomText.translated(
                      () => R.devBio,
                      style: AppTextStyle.styleBase.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ).centered,
                  ],
                ),
              ),
              const Divider(color: AppColor.border),
              SidebarItem(
                icon: Icons.logout,
                label: R.logout,
                onTap: viewModel.onLogout,
              ),
              const SizedBox(height: Spacing.x2),
            ],
          ),
        ),
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData? icon;
  final String label;
  final List<SidebarItem>? children;
  final void Function()? onTap;

  const SidebarItem({
    super.key,
    this.icon,
    required this.label,
    this.children,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (children != null && children!.isNotEmpty) {
      return ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(vertical: 4),
        leading: Icon(icon, color: AppColor.primary),
        title: Text(label, style: AppTextStyle.bodyMedium.style),
        children: children!
            .map(
              (child) => Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: child,
              ),
            )
            .toList(),
      );
    }
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Icon(icon, color: AppColor.primary),
      title: Text(label, style: AppTextStyle.bodyMedium.style),
      onTap: onTap,
    );
  }
}
