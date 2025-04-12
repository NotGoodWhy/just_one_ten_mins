import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:just_one_ten_mins/features/home/presentation/pages/home_page.dart';
import 'package:just_one_ten_mins/features/library/presentation/pages/library_page.dart';
import 'package:just_one_ten_mins/features/settings/presentation/pages/settings_page.dart';
import 'package:just_one_ten_mins/features/upload/presentation/pages/upload_page.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: Center(
        child: Text(l10n.home),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // 탭 전환 구현 예정
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: l10n.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.library_books_outlined),
            activeIcon: const Icon(Icons.library_books),
            label: l10n.library,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.upload_outlined),
            activeIcon: const Icon(Icons.upload),
            label: l10n.upload,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            label: l10n.settings,
          ),
        ],
      ),
    );
  }
} 