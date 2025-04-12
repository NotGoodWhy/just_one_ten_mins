import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:just_one_ten_mins/features/home/presentation/pages/home_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomePage.page, path: '/', initial: true),
  ];
} 