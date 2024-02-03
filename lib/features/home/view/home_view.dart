import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app_task/features/home/providers/notes_provider.dart';
import 'package:notes_app_task/features/home/view/widgets/note_dialog.dart';
import 'package:notes_app_task/features/home/view/widgets/notes_list.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes App'),
          centerTitle: true,
        ),
        body: const NotesList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final note = await createOrUpdateNoteDialog(context);
            if (note != null) {
              ref.read(notesProvider.notifier).addNote(note);
            }
          },
          child: const Icon(Icons.add),
        ));
  }
}
