class Move {
  final String name;

  Move({
    required this.name
  });

  factory Move.fromJson(Map<String, dynamic> json){
    return Move(name: json['name']);
  }
}