import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../../style/styte.dart';

class AppVersionInfo extends StatelessWidget {
  final TextStyle? textStyle;
  final bool showBuildNumber;

  const AppVersionInfo({
    super.key,
    this.textStyle,
    this.showBuildNumber = true,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        final version = snapshot.data!.version;
        final buildNumber = snapshot.data!.buildNumber;
        final displayText = showBuildNumber
            ? 'v$version+$buildNumber'
            : 'v$version';

        return Text(
          displayText,
          style:
              textStyle ??
              AppTextStyle.caption.style.copyWith(color: AppColor.guest),
        );
      },
    );
  }
}
