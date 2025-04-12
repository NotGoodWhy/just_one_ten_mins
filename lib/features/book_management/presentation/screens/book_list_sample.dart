import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/widgets.dart';

/// 샘플 데이터 모델
class BookSample {
  final String id;
  final String title;
  final String author;
  final String thumbnailUrl;

  BookSample({
    required this.id,
    required this.title,
    required this.author,
    required this.thumbnailUrl,
  });
}

/// 샘플 데이터
final List<BookSample> sampleBooks = [
  BookSample(
    id: '1',
    title: '소프트웨어 장인',
    author: '산드로 만쿠소',
    thumbnailUrl: 'https://via.placeholder.com/150',
  ),
  BookSample(
    id: '2',
    title: '클린 코드',
    author: '로버트 C. 마틴',
    thumbnailUrl: 'https://via.placeholder.com/150',
  ),
  BookSample(
    id: '3',
    title: '함께 자라기',
    author: '김창준',
    thumbnailUrl: 'https://via.placeholder.com/150',
  ),
];

/// 도서 목록 샘플 화면
class BookListSampleScreen extends StatelessWidget {
  const BookListSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 서재'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showAddBookDialog(context);
            },
          ),
        ],
      ),
      body: sampleBooks.isEmpty
          ? AppEmptyState(
              title: '도서가 없습니다',
              message: '새 책을 추가하거나 PDF를 업로드해보세요.',
              buttonLabel: '추가하기',
              onButtonPressed: () {
                _showAddBookDialog(context);
              },
            )
          : ListView.builder(
              padding: EdgeInsets.all(AppDimensions.spacingM),
              itemCount: sampleBooks.length,
              itemBuilder: (context, index) {
                final book = sampleBooks[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: AppDimensions.spacingM),
                  child: _buildBookCard(context, book),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddBookDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBookCard(BuildContext context, BookSample book) {
    return AppListCard(
      title: book.title,
      subtitle: book.author,
      leading: Container(
        width: 50,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        ),
        child: const Icon(Icons.book, color: AppColors.primary),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.play_arrow, color: AppColors.secondary),
        onPressed: () {
          // 오디오 재생 기능
        },
      ),
      onTap: () {
        // 도서 상세 페이지로 이동
      },
    );
  }

  void _showAddBookDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('새 콘텐츠 추가'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                label: 'PDF 파일 업로드',
                icon: Icons.upload_file,
                isFullWidth: true,
                onPressed: () {
                  Navigator.pop(context);
                  // PDF 업로드 기능
                },
              ),
              SizedBox(height: AppDimensions.spacingM),
              AppButton(
                label: '책 스캔하기',
                icon: Icons.camera_alt,
                type: ButtonType.secondary,
                isFullWidth: true,
                onPressed: () {
                  Navigator.pop(context);
                  // 카메라 스캔 기능
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('취소'),
            ),
          ],
        );
      },
    );
  }
} 