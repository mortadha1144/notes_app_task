import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app_task/features/home/providers/notes_provider.dart';
import 'package:notes_app_task/features/home/view/widgets/note_list_tile.dart';

class NotesList extends ConsumerWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);
    return notes.isNotEmpty
        ? ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return NoteListTile(note: note);
            },
          )
        : const Center(
            child: Text('No notes yet'),
          );
  }
}

