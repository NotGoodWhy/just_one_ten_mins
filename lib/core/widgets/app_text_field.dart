import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/theme.dart';

/// 앱 전체에서 사용되는 일관된 텍스트 필드 컴포넌트
class AppTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const AppTextField({
    Key? key,
    required this.label,
    this.hint,
    this.errorText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.onChanged,
    this.inputFormatters,
    this.validator,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          maxLength: maxLength,
          enabled: enabled,
          focusNode: focusNode,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          validator: validator,
          style: AppTextStyles.bodyMedium,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            errorText: errorText,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: onSuffixIconTap,
                    child: Icon(suffixIcon),
                  )
                : null,
            contentPadding: EdgeInsets.all(AppDimensions.spacingM),
            counterText: '', // 카운터 텍스트 숨기기
          ),
        ),
      ],
    );
  }
}

/// 여러 줄 입력을 위한 텍스트 에어리어 컴포넌트
class AppTextArea extends AppTextField {
  const AppTextArea({
    Key? key,
    required String label,
    String? hint,
    String? errorText,
    TextEditingController? controller,
    bool enabled = true,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    FocusNode? focusNode,
  }) : super(
          key: key,
          label: label,
          hint: hint,
          errorText: errorText,
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          enabled: enabled,
          onChanged: onChanged,
          validator: validator,
          focusNode: focusNode,
        );
} 