import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('라이브러리'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: 필터링 기능 구현
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.book, color: Colors.white),
              ),
              title: Text('도서 제목 ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('요약: 약 10분', style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 4),
                  Text('저장: ${DateTime.now().toString().substring(0, 10)}',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.play_circle_outline),
                onPressed: () {
                  // TODO: 오디오 플레이어 화면으로 이동
                },
              ),
              onTap: () {
                // TODO: 요약 상세 화면으로 이동
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 새 책 추가하기
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} 