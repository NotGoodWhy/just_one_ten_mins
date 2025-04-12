import 'package:flutter/material.dart';
import '../theme/theme.dart';
import 'app_button.dart';

/// 데이터가 없는 경우 표시되는 빈 상태 컴포넌트
class AppEmptyState extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final String? buttonLabel;
  final VoidCallback? onButtonPressed;

  const AppEmptyState({
    Key? key,
    required this.title,
    required this.message,
    this.icon = Icons.hourglass_empty,
    this.buttonLabel,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.spacingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppDimensions.iconXL,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: AppDimensions.spacingM),
            Text(
              title,
              style: AppTextStyles.heading3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.spacingS),
            Text(
              message,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (buttonLabel != null && onButtonPressed != null) ...[
              SizedBox(height: AppDimensions.spacingL),
              AppButton(
                label: buttonLabel!,
                onPressed: onButtonPressed,
                type: ButtonType.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 오류 발생 시 표시되는 에러 상태 컴포넌트
class AppErrorState extends StatelessWidget {
  final String title;
  final String message;
  final String? buttonLabel;
  final VoidCallback? onButtonPressed;

  const AppErrorState({
    Key? key,
    this.title = '오류가 발생했습니다',
    required this.message,
    this.buttonLabel = '다시 시도',
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      title: title,
      message: message,
      icon: Icons.error_outline,
      buttonLabel: buttonLabel,
      onButtonPressed: onButtonPressed,
    );
  }
} 