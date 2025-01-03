import 'package:pokemon_app/domain/entities/ability.dart';

class AbilityDetail {
  final Ability ability;

  AbilityDetail({
    required this.ability
  });

  factory AbilityDetail.fromJson(Map<String, dynamic> json){
    return AbilityDetail(
      ability: Ability.fromJson(json['ability']));
  }
}