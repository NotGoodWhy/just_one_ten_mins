import 'package:flutter/material.dart';

/// 최근 요약본 목록 컴포넌트
class RecentSummariesList extends StatelessWidget {
  const RecentSummariesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 샘플 데이터로 빈 리스트 확인
    final hasRecentSummaries = true;
    
    if (!hasRecentSummaries) {
      return _buildEmptyState(context);
    }
    
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                // TODO: 요약 상세 화면으로 이동
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 책 커버 이미지
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.primaries[index % Colors.primaries.length],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.book,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // 책 정보
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '도서 제목 ${index + 1}',
                            style: Theme.of(context).textTheme.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '약 10분',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  
  /// 요약본이 없을 때 표시할 빈 상태 위젯
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Icon(
              Icons.book_outlined,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              '최근 요약본이 없습니다.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8),
            const Text('먼저 책이나 PDF 파일을 업로드해 보세요.'),
          ],
        ),
      ),
    );
  }
} 