import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/entities/pokemon.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}


// ignore: must_be_immutable
class PokemonDetailScreen  extends StatefulWidget{
  static const String name = 'pokemon detail';
   Pokemon pokemon;

  PokemonDetailScreen({super.key, 
    required this.pokemon
  });

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  final PageController pageController = PageController();
  bool endReached = false;

  late List<SlideInfo> pokemonSlides;

  @override
  void initState(){
    super.initState();

      pokemonSlides = [
  SlideInfo(widget.pokemon.name, 'los ataques de este pokemon ${widget.pokemon.abilities[0].ability.name} ', widget.pokemon.sprites.frontShiny),
  SlideInfo(widget.pokemon.name, 'los ataques de este pokemon ${widget.pokemon.abilities[1].ability.name} ', widget.pokemon.sprites.backDefault),
  SlideInfo(widget.pokemon.name, 'los ataques de este pokemon ${widget.pokemon.abilities[1].ability.name} ', widget.pokemon.sprites.backShiny),

 ];


    pageController.addListener((){
      final page = pageController.page ?? 0;
      if (!endReached && page >= (1.5)){
        setState((){
          endReached = true;
        });
      }
    }
    );
  }

@override
  void dispose(){
    pageController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pokemon detail"),
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: pokemonSlides.map(
              (slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl)
            ).toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: Text('Salir'),
              onPressed: () => context.pop(), 
              )
          ),
           endReached ? 
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Comenzar'),
                ),
              )
            ): const SizedBox(),

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget{
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl
  });
  
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(imageUrl, height: 100, fit: BoxFit.contain,)),
            const SizedBox(height: 20,),
            Text(title),
            const SizedBox(height: 10,),
            Text(caption),
          ],
        ),
      ),);
  }
  
}
