import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_dimensions.dart';

/// 앱 테마 설정을 관리하는 클래스
class AppTheme {
  static const _primaryColor = Color(0xFF6750A4);
  static const _secondaryColor = Color(0xFF8B69FF);
  static const _errorColor = Color(0xFFBA1A1A);
  
  // Light theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.light,
      primary: _primaryColor,
      secondary: _secondaryColor,
      error: _errorColor,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: _primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
    ),
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.heading1,
      displayMedium: AppTextStyles.heading2,
      displaySmall: AppTextStyles.heading3,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.button,
      labelMedium: AppTextStyles.caption,
      labelSmall: AppTextStyles.overline,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _primaryColor,
        minimumSize: Size(88, AppDimensions.buttonHeight),
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingL),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
        ),
        side: const BorderSide(color: _primaryColor),
        textStyle: AppTextStyles.button,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _primaryColor,
        minimumSize: Size(88, AppDimensions.buttonHeight),
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingM),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
        ),
        textStyle: AppTextStyles.button,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 1,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.textPrimary,
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.surface,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
  
  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.dark,
      primary: _primaryColor,
      secondary: _secondaryColor,
      error: _errorColor,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
    ),
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.heading1,
      displayMedium: AppTextStyles.heading2,
      displaySmall: AppTextStyles.heading3,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.button,
      labelMedium: AppTextStyles.caption,
      labelSmall: AppTextStyles.overline,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _primaryColor,
        minimumSize: Size(88, AppDimensions.buttonHeight),
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingL),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
        ),
        side: const BorderSide(color: _primaryColor),
        textStyle: AppTextStyles.button,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _primaryColor,
        minimumSize: Size(88, AppDimensions.buttonHeight),
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacingM),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
        ),
        textStyle: AppTextStyles.button,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 1,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.textPrimary,
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.surface,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
  
  // 생성자 - 인스턴스화 방지
  AppTheme._();
} 