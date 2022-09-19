// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

enum Answers { YES, NO }

class _FavoriteScreenState extends State<FavoriteScreen> {
  String _value = '';
  void _setValue(String value) => setState(() => _value = value);

  void openDialog(BuildContext context, int index) {
    showDialog<Answers>(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: Text('AlertDialog: Item $index'),
        content: const Text('アラートダイアログです。YesかNoを選択してください。'),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context, Answers.NO);
            },
          ),
          ElevatedButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.pop(context, Answers.YES);
            },
          )
        ],
      ),
    ).then((value) {
      switch (value) {
        case Answers.YES:
          _setValue('Yes');
          break;
        case Answers.NO:
        default:
          _setValue('No');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(100, (index) {
          return Center(
            child: new TextButton(
              onPressed: () {
                openDialog(context, index);
              },
              child: new Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          );
        }),
      ),
    );
  }
}
