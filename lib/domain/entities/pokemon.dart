import 'package:pokemon_app/domain/entities/ability_detail.dart';
import 'package:pokemon_app/domain/entities/sprite.dart';

class Pokemon {

  final int id;
  final String name;
  final int height;
  final List<AbilityDetail> abilities;
  //final List<Move> moves;
  final Sprite sprites;

  const Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.abilities,
    //required this.moves,
    required this.sprites
  });

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      id: json['id'], 
      name: json['name'], 
      height: json['height'], 
      abilities: (json['abilities'] as List<dynamic>).map((item) => AbilityDetail.fromJson(item)).toList(), 
      //moves: (json['moves'] as List<dynamic>).map((item) => Move.fromJson(item)).toList(), 
      sprites: Sprite.fromJson(json['sprites']),
    );
  }


}