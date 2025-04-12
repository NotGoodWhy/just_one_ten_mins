import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// 전체 화면 로딩 인디케이터 컴포넌트
class AppLoadingScreen extends StatelessWidget {
  final String? message;

  const AppLoadingScreen({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background.withOpacity(0.7),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: AppColors.primary,
            ),
            if (message != null)
              Padding(
                padding: EdgeInsets.only(top: AppDimensions.spacingM),
                child: Text(
                  message!,
                  style: AppTextStyles.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 컨텐츠 로딩 인디케이터 컴포넌트
class AppLoading extends StatelessWidget {
  final double size;
  final Color? color;

  const AppLoading({
    Key? key,
    this.size = 24.0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: size / 8,
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}

/// 데이터 로딩 시 스켈레톤 로더 컴포넌트
class AppSkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const AppSkeletonLoader({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.disabled,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
} 