import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/config/theme/app_theme.dart';

final themeDarkProvider = StateProvider<bool>((ref) => false);

final selectedColorProvider = StateProvider<int>((ref) => 0);

// Listado colores

final colorListProvider = Provider((ref) => colorList);

final colorListText = Provider((ref) => colorText);

//objeto personalizado AppTheme

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier());

// Controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme>{
  // State o estado de instancia AppTheme
  ThemeNotifier(): super( AppTheme());

  void toggleDarkMode (){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void setSelectedColor(int indexSelectedColor){
    state = state.copyWith(selectedColor: indexSelectedColor);
  }



}