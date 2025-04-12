import 'package:flutter/material.dart';
import '../theme/theme.dart';

enum ButtonType { primary, secondary, text }
enum ButtonSize { small, medium, large }

/// 앱 전체에서 사용되는 일관된 버튼 컴포넌트
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;

  const AppButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 버튼 크기에 따른 패딩 및 높이 설정
    double height;
    EdgeInsets padding;
    
    switch (size) {
      case ButtonSize.small:
        height = AppDimensions.buttonSmallHeight;
        padding = EdgeInsets.symmetric(horizontal: AppDimensions.spacingM);
        break;
      case ButtonSize.large:
        height = AppDimensions.buttonHeight + 8;
        padding = EdgeInsets.symmetric(horizontal: AppDimensions.spacingXL);
        break;
      case ButtonSize.medium:
      default:
        height = AppDimensions.buttonHeight;
        padding = EdgeInsets.symmetric(horizontal: AppDimensions.spacingL);
    }
    
    // 버튼 내용
    Widget content = Row(
      mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          Padding(
            padding: EdgeInsets.only(right: AppDimensions.spacingS),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: _getButtonTextColor(context),
              ),
            ),
          )
        else if (icon != null)
          Padding(
            padding: EdgeInsets.only(right: AppDimensions.spacingS),
            child: Icon(icon, size: AppDimensions.iconS),
          ),
        Text(label),
      ],
    );
    
    // 전체 너비 설정
    Widget button;
    
    switch (type) {
      case ButtonType.secondary:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            padding: padding,
            minimumSize: Size(isFullWidth ? double.infinity : 0, height),
          ),
          child: content,
        );
        break;
      case ButtonType.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            padding: padding,
            minimumSize: Size(isFullWidth ? double.infinity : 0, height),
          ),
          child: content,
        );
        break;
      case ButtonType.primary:
      default:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            padding: padding,
            minimumSize: Size(isFullWidth ? double.infinity : 0, height),
          ),
          child: content,
        );
    }
    
    return button;
  }
  
  Color _getButtonTextColor(BuildContext context) {
    switch (type) {
      case ButtonType.primary:
        return AppColors.textOnPrimary;
      case ButtonType.secondary:
      case ButtonType.text:
        return AppColors.primary;
      default:
        return AppColors.textOnPrimary;
    }
  }
} 