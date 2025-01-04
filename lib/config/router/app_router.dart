import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/domain/entities/pokemon.dart';
import 'package:pokemon_app/presentation/screens/batalla/batalla_screen.dart';
import 'package:pokemon_app/presentation/screens/cards/cards_screen.dart';
import 'package:pokemon_app/presentation/screens/home/home.dart';
import 'package:pokemon_app/presentation/screens/license/license_screen.dart';
import 'package:pokemon_app/presentation/screens/options/options_screen.dart';
import 'package:pokemon_app/presentation/screens/pokemon_detail/pokemon_detail_screen.dart';
import 'package:pokemon_app/presentation/screens/theme/theme_screen.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    name: Home.name,
    builder: (context, state) => const Home(),
  ),
  GoRoute(
      path: "/options",
      name: OptionsScreen.name,
      builder: (context, state) => const OptionsScreen()),
  GoRoute(
      path: "/pokemon",
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen()),
  GoRoute(
      path: '/pokemon-detail',
      name: PokemonDetailScreen.name,
      builder: (context, state) {
        final pokemon = state.extra as Pokemon;
        return PokemonDetailScreen(pokemon: pokemon);
      }),
  GoRoute(
      path: "/batalla",
      name: BatallaScreen.name,
      builder: (context, state) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ]);
        return const BatallaScreen();
      },
      onExit: (context, state) {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        return true;
      }),
  GoRoute(
      path: "/licencia",
      name: LicenseScreen.name,
      builder: (context, state) => const LicenseScreen()),
  GoRoute(
      path: "/configuracion",
      name: ThemeScreen.name,
      builder: (context, state) => const ThemeScreen()),
]);
