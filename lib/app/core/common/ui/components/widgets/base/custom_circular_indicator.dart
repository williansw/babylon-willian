import 'package:flutter/material.dart';

import '../../../../../style/styte.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final String? message;
  final bool withBackground;

  const CustomLoadingIndicator({
    super.key,
    this.message,
    this.withBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: withBackground
          ? Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.backgroundDark,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.text.withValues(alpha: 0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: _buildIndicatorContent(),
            )
          : _buildIndicatorContent(),
    );
  }

  Widget _buildIndicatorContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
            backgroundColor: AppColor.primary.withValues(alpha: 0.1),
          ),
        ),
        if (message != null) ...[
          const SizedBox(height: 12),
          Text(
            message!,
            style: const TextStyle(
              color: AppColor.text,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}
