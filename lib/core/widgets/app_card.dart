import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// 앱 전체에서 사용되는 일관된 카드 컴포넌트
class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const AppCard({
    Key? key,
    required this.child,
    this.onTap,
    this.padding,
    this.elevation,
    this.backgroundColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = borderRadius ?? 
      BorderRadius.circular(AppDimensions.cardRadius);
    
    return Card(
      elevation: elevation ?? AppDimensions.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
      ),
      color: backgroundColor ?? AppColors.surface,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Padding(
          padding: padding ?? EdgeInsets.all(AppDimensions.spacingM),
          child: child,
        ),
      ),
    );
  }
}

/// 목록에서 사용되는 카드 아이템 컴포넌트
class AppListCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final double? elevation;

  const AppListCard({
    Key? key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: elevation,
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.all(AppDimensions.spacingM),
        leading: leading,
        title: Text(
          title,
          style: AppTextStyles.bodyLarge,
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: AppTextStyles.bodySmall,
              )
            : null,
        trailing: trailing,
      ),
    );
  }
} 