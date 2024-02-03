import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes App'),
        ),
        body: const Center(
          child: Text(
            'Welcome to the Notes App!',
            style: TextStyle(fontSize: 24),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: const Text('Add Note'),
                content: const Text('You have clicked the button'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  )
                ],
              );
            },);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
