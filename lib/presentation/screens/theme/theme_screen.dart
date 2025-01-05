import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/presentation/providers/theme_dark_provider.dart';

class ThemeScreen extends ConsumerWidget{
  static String name = 'selecciòn de tema';
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch( themeNotifierProvider ).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('Selecciòn de tema'),
        actions: [
          IconButton(
            onPressed: (){
              //ref.read(themeDarkProvider.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();

            }, 
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined))
        ],
      ),
      body: const _ThemeChangerViwer(),
    );
  }
}

class _ThemeChangerViwer extends ConsumerWidget {
  const _ThemeChangerViwer();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final List<String> colorString = ref.watch(colorListText);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index){

        final color = colors[index];
        final colorText = colorString[index];

        return RadioListTile(
          title: Text('Color: $colorText', style: TextStyle(color: color),),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value){
            ref.read(themeNotifierProvider.notifier).setSelectedColor(index);
          });


      },

    );
  }
}