import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/config/router/app_router.dart';
import 'package:pokemon_app/config/theme/app_theme.dart';
import 'package:pokemon_app/presentation/providers/theme_dark_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp())
    );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    //final int selectedColor = ref.watch(selectedColorProvider);
    //final bool isDarkMode = ref.watch(themeDarkProvider);
    final AppTheme appTheme = ref.watch( themeNotifierProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: appRouter,
      theme: appTheme.getTheme()
    );
  }
}

