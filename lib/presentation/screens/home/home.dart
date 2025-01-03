import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  static const String name = 'home_screen';
  
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return  Scaffold(

      body: Stack(
        children: [        
          Positioned.fill(
          left: 50,
          child: Image.network("https://i.pinimg.com/originals/13/57/33/135733b07291badc8cb3c083d4fd90b0.gif"),
        ),

        Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Image.asset('assets/image/PikPng.com_pokeball-png_590214.png',
              height: 200,)
            ),)
          ],
        ),
        Positioned(
          bottom: 30,
          right: (screenWidth / 2) - 30,
          child: FloatingActionButton(
            onPressed: (){
              context.push("/options");
            },
            child:  const Icon(Icons.menu,
            size: 30,)
            )
        )

        ]
         ),

      );
  }
}