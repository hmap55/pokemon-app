import 'package:go_router/go_router.dart';
import 'package:pokemon_app/domain/entities/pokemon.dart';
import 'package:pokemon_app/presentation/screens/batalla/batalla_screen.dart';
import 'package:pokemon_app/presentation/screens/cards/cards_screen.dart';
import 'package:pokemon_app/presentation/screens/home/home.dart';
import 'package:pokemon_app/presentation/screens/options/options_screen.dart';
import 'package:pokemon_app/presentation/screens/pokemon_detail/pokemon_detail_screen.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: Home.name,
      builder: (context, state) => const Home(),
      
      ),
    GoRoute(
      path: "/options",
      name: OptionsScreen.name,
      builder: (context, state) => const OptionsScreen()
      ),
    GoRoute(
      path: "/pokemon",
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen()
      ),
    GoRoute(
        path: '/pokemon-detail',
        name: PokemonDetailScreen.name,
        builder: (context, state){
          final pokemon = state.extra as Pokemon;
          return PokemonDetailScreen(pokemon: pokemon);
        }
        ),
    GoRoute(
      path: "/batalla",
      name: BatallaScreen.name,
      builder: (context, state) => const BatallaScreen()
      ),

  ]
  );