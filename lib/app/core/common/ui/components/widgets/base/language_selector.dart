import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../constants/languages/languages.dart';
import '../../../../../services/locate_service.dart';
import '../../../../../style/styte.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocateService>(
      builder: (context, viewModel, child) {
        return PopupMenuButton<LanguageEnum>(
          onSelected: (lang) => viewModel.changeLocale(lang.code),
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.language, size: 22, color: AppColor.text),
              SizedBox(width: 4),
              Icon(Icons.arrow_drop_down, size: 20, color: AppColor.success),
            ],
          ),
          itemBuilder: (context) {
            return LanguageEnum.values.map((lang) {
              final isSelected = lang == viewModel.selectedLanguage;
              return PopupMenuItem<LanguageEnum>(
                value: lang,
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 18,
                      color: isSelected ? AppColor.success : Colors.transparent,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      lang.name,
                      style: AppTextStyle.bodyMedium.style.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: AppColor.text,
                      ),
                    ),
                  ],
                ),
              );
            }).toList();
          },
        );
      },
    );
  }
}
