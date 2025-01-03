class Sprite {
  final String frontDefault;
  final String backDefault;
  final String frontShiny;
  final String backShiny;

  Sprite({
    required this.frontDefault,
    required this.backDefault,
    required this.frontShiny,
    required this.backShiny
  });

  factory Sprite.fromJson(Map<String, dynamic> json){
    return Sprite(
      frontDefault: json['front_default'], 
      backDefault: json['back_default'], 
      frontShiny: json['front_shiny'], 
      backShiny: json['back_shiny'],
      );
  }
}