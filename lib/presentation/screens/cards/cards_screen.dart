import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/entities/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';

class CardsScreen extends StatefulWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {

  List<int> pokemonsIds = [1,2,3,4,5];
  List<Pokemon> pokemons = [];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {

    loadPokemons();

    super.initState();
    scrollController.addListener((){
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        loadNextPokemon();
      }

    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future loadPokemons() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {
    });

    for (int id in pokemonsIds){
      final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');

      try {
        final response = await http.get(url);

        if (response.statusCode == 200){
          final pokemon = jsonDecode(response.body);
          setState(() {
            pokemons.add(Pokemon.fromJson(pokemon));
          });
          
        }else{
          print('Error al obtener el pokemon con ID $id: ${response.statusCode}');
        }
      } catch (e){
        print('Error al obtener el pokemon con ID $id: $e');
      }

    }

    print(pokemons.first.name);
    isLoading = false;
    setState(() {
      
    });

  }

void addFivePokemon(){
  final lastId = pokemonsIds.last;

  pokemonsIds.clear();

  pokemonsIds.addAll([1,2,3,4,5].map((e) => lastId + e));
}

Future loadNextPokemon() async{
  if (isLoading) return;

 addFivePokemon();
 await loadPokemons();
 

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pokemons'),
      ),
      body: MediaQuery.removePadding(
        context: context, 
        child: ListView.builder(
          controller: scrollController,
          itemCount: pokemons.length + (isLoading ? 1 : 0),
          itemBuilder: (context, index){
            if (index == pokemons.length){
              return const Center(
                child: Padding(padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),),
              );
            }
            return Container(
              width: 350.0,
              padding: const EdgeInsets.only(left: 80.0, right: 80.0, bottom: 20.0),
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    context.push(
                      "/pokemon-detail",
                      extra: pokemons[index]);
                  },
                  child: Column(
                    children: [
                      Image.network(pokemons[index].sprites.frontDefault,
                      height: 100,
                      fit: BoxFit.scaleDown,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                          child: Table(
                            defaultColumnWidth: const IntrinsicColumnWidth(),
                            children: [
                              TableRow(
                                children: [
                                  _buildTableCell('Nombre: '),
                                  _buildTableCell(pokemons[index].name)
                                ]
                              ),
                              TableRow(
                                children: [
                                  _buildTableCell('Peso: '),
                                  _buildTableCell(pokemons[index].height.toString())
                                ]
                              ),
                              
                              TableRow(
                                children: [
                                  _buildTableCell('Habilidades: '),
                                  _buildTableCell(pokemons[index].abilities[0].ability.name)
                                ]
                              ),
                              /*
                              TableRow(
                                children: [
                                  _buildTableCell('Ataques: '),
                                  _buildTableCell(pokemons[index].moves[0].name)
                                ]
                              ),*/
                                
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              
              ),
            );
          })),
    );
  }
}

Widget _buildTableCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Espaciado dentro de las celdas
        child: Text(
          text,
          textAlign: TextAlign.center, // Centra el texto dentro de la celda
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }