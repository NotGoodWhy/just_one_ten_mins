import 'package:flutter/material.dart';

/// 홈 화면 사용 팁 카드 컴포넌트
class UsageTipsCard extends StatelessWidget {
  const UsageTipsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  '사용 팁',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text('PDF 파일을 업로드하거나 책을 직접 스캔하여 10분 분량의 음성 요약본으로 변환해보세요.'),
            const SizedBox(height: 8),
            const Text('라이브러리에서 저장된 요약본을 언제든지 다시 들을 수 있습니다.'),
          ],
        ),
      ),
    );
  }
} 