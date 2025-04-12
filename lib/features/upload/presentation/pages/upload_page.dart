import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class UploadPage extends StatelessWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('업로드'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            _buildUploadOption(
              context,
              title: '파일 선택',
              subtitle: 'PDF 파일을 업로드하세요',
              icon: Icons.file_upload,
              onTap: () {
                // TODO: PDF 파일 선택 기능 구현
              },
            ),
            const SizedBox(height: 20),
            _buildUploadOption(
              context,
              title: '책 스캔',
              subtitle: '책 페이지를 카메라로 스캔하세요',
              icon: Icons.camera_alt,
              onTap: () {
                // TODO: 책 스캔 기능 구현
              },
            ),
            const SizedBox(height: 20),
            _buildUploadOption(
              context, 
              title: '텍스트 입력',
              subtitle: '텍스트를 직접 입력하세요',
              icon: Icons.text_fields,
              onTap: () {
                // TODO: 텍스트 입력 기능 구현
              },
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '파일 업로드 후 AI가 10분 분량의 오디오 요약본을 생성합니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
} 