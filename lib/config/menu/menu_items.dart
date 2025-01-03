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


  ];
