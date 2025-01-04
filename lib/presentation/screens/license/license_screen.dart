import 'package:flutter/material.dart';

class LicenseScreen extends StatelessWidget{
   static String name = 'License';

  const LicenseScreen({super.key});
   
     @override
     Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Licencias'),
          ),
          body: Center(
            child: FilledButton(
              onPressed: (){
                showAboutDialog(context: context,
                  children: [
                    const Text('Aqui podras ver las licencias usadas para el desarrollo de la pokeApp')
                  ]
                );
              }, 
              child: const Text('Licencias')),
          ),
        );
     }

  
}