import 'dart:ui';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BatallaScreen extends StatefulWidget {
  static const String name = 'Batalla';

  const BatallaScreen({super.key});

  @override
  State<BatallaScreen> createState() => _BatallaScreenState();
}

class _BatallaScreenState extends State<BatallaScreen> {
  
  String? selectedOption1;
  String? selectedOption2;
  bool isSelected1 = false;
  bool isSelected2 = true;
  bool isGameOver = false;

  int life1 = 500;
  int life2 = 500;

  @override
  Widget build(BuildContext context) {
    final List<String> options = ['embestida', 'lanzallamas', 'impacto'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo batalla'),
      ),
      body: ListView(padding: const EdgeInsets.all(16.0), children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Life points: $life1 ',
              style: const TextStyle(fontSize: 16),
            ),
            Text('Life points: $life2', style: const TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            Image.network(
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/23ddfd0a-6934-4f06-9fa9-8be687766403/d81zxe8-ef67d1cf-fddc-4c62-9e61-13af794d876d.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzIzZGRmZDBhLTY5MzQtNGYwNi05ZmE5LThiZTY4Nzc2NjQwM1wvZDgxenhlOC1lZjY3ZDFjZi1mZGRjLTRjNjItOWU2MS0xM2FmNzk0ZDg3NmQuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.O17RaDSNgsm86-CK5mxNkkeUkyrygiyF0uOyz_rdwas',
              width: 200,
              height: 150,
            ),
            Image.network(
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/029b8bd9-cb5a-41e4-9c7e-ee516face9bb/dayo3ow-7ac86c31-8b2b-4810-89f2-e6134caf1f2d.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzAyOWI4YmQ5LWNiNWEtNDFlNC05YzdlLWVlNTE2ZmFjZTliYlwvZGF5bzNvdy03YWM4NmMzMS04YjJiLTQ4MTAtODlmMi1lNjEzNGNhZjFmMmQuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ooubhxjHp9PIMhVxvCFHziI6pxDAS8glXPWenUeomWs',
              width: 100,
              height: 100,
            ),
            Image.network(
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/23ddfd0a-6934-4f06-9fa9-8be687766403/d81zyat-b09201d6-7fb0-4e5f-b901-06310271882d.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzIzZGRmZDBhLTY5MzQtNGYwNi05ZmE5LThiZTY4Nzc2NjQwM1wvZDgxenlhdC1iMDkyMDFkNi03ZmIwLTRlNWYtYjkwMS0wNjMxMDI3MTg4MmQuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ag1msFLyFSLnPt8Bp69N5tqqtT_tUGmXZWi3VEzZ2NM',
              width: 200,
              height: 150,
            )
          ],
        )),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Wrap(spacing: 100, alignment: WrapAlignment.center, children: [
            IgnorePointer(
              ignoring: isSelected2 ? false : true,
              child: DropdownButton<String>(
                focusColor: isSelected1
                    ? const Color.fromARGB(255, 136, 212, 136)
                    : const Color.fromARGB(255, 230, 159, 154),
                hint: const Text('Ataque'),
                value: selectedOption1,
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                      value: option, child: Text(option));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption1 = newValue;
                    isSelected1 = true;
                    isSelected2 = false;
                  });
                },
              ),
            ),
            IgnorePointer(
              ignoring: isSelected1 ? false : true,
              child: DropdownButton<String>(
                hint: const Text('Ataque'),
                value: selectedOption2,
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                      value: option, child: Text(option));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption2 = newValue;
                    isSelected1 = false;
                    isSelected2 = true;
                  });
                },
              ),
            ),
          ]),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                if (isSelected1 && life2 > 0 && selectedOption1 != null) {
                  setState(() {
                    life2 = setAttack(selectedOption1, life2);
                    if (life2 == 0) isGameOver = true;
                  });
                  _showModalScreen(context, 'Hypnotize', 100, isGameOver);
                } else if (isSelected2 && life1 > 0 && selectedOption2 != null){
                  setState(() {
                    life1 = setAttack(selectedOption2, life1);
                    if (life1 == 0) isGameOver = true;
                  });
                  _showModalScreen(context, 'bulbasaur', 100, isGameOver);
                }
              },
              child: const Text('Atack')),
        )
      ]),
    );
  }
}

int setAttack(String? attack, int lp) {
  var logger = Logger();
  int result = lp;

  switch (attack) {
    case 'embestida':
      result -= 100;
      break;
    case 'lanzallamas':
      result -= 150;
      break;
    case 'impacto':
      result -= 200;
      break;
    default:
     logger.e("error ejecutando ataque");
  }

  if (result < 0) result = 0;

  return result;
}

void _showModalScreen(BuildContext context, String selected, int count, bool isGameOver){
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),)),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isGameOver)
                      Image.network('https://media4.giphy.com/media/1hMbkOaFfYmZvvEBq9/giphy.gif?cid=6c09b9528retbczo8qv5lb5bjcmunyg9nq3pv6hex499fdh5&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=ts', 
                      width: 150,
                      height: 150,),
                    if (!isGameOver)
                      Text('!ATAQUE DE $selected:  - $count',
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'italica'),),
                      Image.network('https://i.gifer.com/origin/d7/d7ac4f38b77abe73165d85edf2cbdb9e_w200.gif',
                      width: 100,
                      height: 100,) 
                  ],
                ),
              ),
              
              

            )
          ],
        ),
      );
    });
  Future.delayed(const Duration(seconds: 2), (){
    // ignore: use_build_context_synchronously
    context.pop();
  });
}
