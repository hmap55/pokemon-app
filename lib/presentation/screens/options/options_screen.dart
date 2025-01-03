import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/config/menu/menu_items.dart';

class OptionsScreen extends StatelessWidget {

  static const String name = 'options_screen';
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conoce tu pokemon'),
      ),
      body: const _OptionsView(),
    );
  }
}

class _OptionsView extends StatelessWidget {
  const _OptionsView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItem.length,
      itemBuilder: (context, index){
        final menuItem = appMenuItem[index];

        return _CustomOption(menuItem: menuItem);
      }
      );
  }
}

class _CustomOption extends StatelessWidget {
  final MenuItems menuItem;

  const _CustomOption({
    required this.menuItem
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: menuItem.icon,
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}