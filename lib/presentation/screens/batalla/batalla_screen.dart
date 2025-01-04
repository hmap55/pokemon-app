import 'package:flutter/material.dart';

class BatallaScreen extends StatelessWidget {

  static const String name = 'Batalla';

  const BatallaScreen({super.key});


  @override
  Widget build(BuildContext context) {
     //String? _selectedOption;
     final List<String> options = ['embestida', 'lanzallamas', 'impacto'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo batalla'),
      ),
      body:  ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Life points: ', style: TextStyle(fontSize: 16),),
              Text('Life points: ', style: TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 20,),

          Center(
            
            child: SizedBox(
              height: 400,
              width: 400,
              child: Image.asset('assets/image/charmander.jpg',
              fit: BoxFit.cover,),
            )
            ,
          ),
          const SizedBox(height: 20,),
          Center(
            child: Wrap(
              spacing: 100,
              alignment: WrapAlignment.center,
              children: [
                DropdownButton<String>(
                items: options.map((String option){ return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option));
                  }).toList(), 
                onChanged: (String? newValue) {

                },
                ),

              DropdownButton<String>(
                items: options.map((String option){ return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option));
                  }).toList(), 
                onChanged: (String? newValue) {

                },
                ),
              ]
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){

              }, 
              child: const Text('Atack')),
          )
        ]
      ),
    );
  }
}