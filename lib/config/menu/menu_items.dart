import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final Image icon;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon
  });
}

  final appMenuItem = <MenuItems>[

    MenuItems(
      title: "Lista de pokemon", 
      subtitle: "aqui podras ver la lista de pokemon disponible", 
      link: "/pokemon", 
      icon: Image.asset('assets/image/pikachu.jpg',)),

    MenuItems(
      title: "Demo pelea", 
      subtitle: "Demo batalla pokemon", 
      link: "/batalla", 
      icon: Image.asset('assets/image/bulbasaur.png',)),

    MenuItems(
      title: "Licencia", 
      subtitle: "Licencias app pokemon", 
      link: "/licencia", 
      icon: Image.asset('assets/image/charmander.jpg',)),

    MenuItems(
      title: "Configuracion de color", 
      subtitle: "Escoge el color de tu preferencia", 
      link: "/config", 
      icon: Image.asset('assets/image/caterpi.jpg',)),


  ];
