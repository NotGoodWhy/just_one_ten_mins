import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          
          // 일반 설정 섹션
          _buildSectionHeader(context, '일반'),
          _buildSettingTile(
            context,
            title: '언어',
            subtitle: '한국어',
            icon: Icons.language,
            onTap: () {
              // TODO: 언어 설정 구현
            },
          ),
          _buildSettingTile(
            context,
            title: '테마',
            subtitle: '시스템 설정에 따름',
            icon: Icons.brightness_6,
            onTap: () {
              // TODO: 테마 설정 구현
            },
          ),
          
          const SizedBox(height: 16),
          
          // 오디오 설정 섹션
          _buildSectionHeader(context, '오디오'),
          _buildSettingTile(
            context,
            title: '기본 음성',
            subtitle: '기본',
            icon: Icons.record_voice_over,
            onTap: () {
              // TODO: 음성 설정 구현
            },
          ),
          _buildSettingTile(
            context,
            title: '기본 재생 속도',
            subtitle: '1.0x',
            icon: Icons.speed,
            onTap: () {
              // TODO: 재생 속도 설정 구현
            },
          ),
          
          const SizedBox(height: 16),
          
          // 앱 정보 섹션
          _buildSectionHeader(context, '앱 정보'),
          _buildSettingTile(
            context,
            title: '버전',
            subtitle: '1.0.0',
            icon: Icons.info_outline,
            onTap: null,
          ),
          _buildSettingTile(
            context,
            title: '개인정보처리방침',
            icon: Icons.privacy_tip_outlined,
            onTap: () {
              // TODO: 개인정보처리방침 구현
            },
          ),
          _buildSettingTile(
            context,
            title: '오픈소스 라이선스',
            icon: Icons.article_outlined,
            onTap: () {
              // TODO: 라이선스 정보 구현
            },
          ),
          
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }

  Widget _buildSettingTile(
    BuildContext context, {
    required String title,
    String? subtitle,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: onTap != null ? const Icon(Icons.chevron_right) : null,
      onTap: onTap,
    );
  }
}

@RoutePage()
class SettingsTab extends ConsumerWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          
          // 일반 설정 섹션
          _buildSectionHeader(context, '일반'),
          _buildSettingTile(
            context,
            title: '언어',
            subtitle: '한국어',
            icon: Icons.language,
            onTap: () {
              // TODO: 언어 설정 구현
            },
          ),
          _buildSettingTile(
            context,
            title: '테마',
            subtitle: '시스템 설정에 따름',
            icon: Icons.brightness_6,
            onTap: () {
              // TODO: 테마 설정 구현
            },
          ),
          
          const SizedBox(height: 16),
          
          // 오디오 설정 섹션
          _buildSectionHeader(context, '오디오'),
          _buildSettingTile(
            context,
            title: '기본 음성',
            subtitle: '기본',
            icon: Icons.record_voice_over,
            onTap: () {
              // TODO: 음성 설정 구현
            },
          ),
          _buildSettingTile(
            context,
            title: '기본 재생 속도',
            subtitle: '1.0x',
            icon: Icons.speed,
            onTap: () {
              // TODO: 재생 속도 설정 구현
            },
          ),
          
          const SizedBox(height: 16),
          
          // 앱 정보 섹션
          _buildSectionHeader(context, '앱 정보'),
          _buildSettingTile(
            context,
            title: '버전',
            subtitle: '1.0.0',
            icon: Icons.info_outline,
            onTap: null,
          ),
          _buildSettingTile(
            context,
            title: '개인정보처리방침',
            icon: Icons.privacy_tip_outlined,
            onTap: () {
              // TODO: 개인정보처리방침 구현
            },
          ),
          _buildSettingTile(
            context,
            title: '오픈소스 라이선스',
            icon: Icons.article_outlined,
            onTap: () {
              // TODO: 라이선스 정보 구현
            },
          ),
          
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }

  Widget _buildSettingTile(
    BuildContext context, {
    required String title,
    String? subtitle,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: onTap != null ? const Icon(Icons.chevron_right) : null,
      onTap: onTap,
    );
  }
} 