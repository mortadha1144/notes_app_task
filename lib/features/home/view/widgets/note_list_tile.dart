import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app_task/core/date_utils.dart';
import 'package:notes_app_task/core/extensions.dart';
import 'package:notes_app_task/features/home/data/models/note.dart';
import 'package:notes_app_task/features/home/providers/notes_provider.dart';
import 'package:notes_app_task/features/home/view/widgets/note_dialog.dart';

class NoteListTile extends ConsumerWidget {
  const NoteListTile({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(note.uuid),
      onDismissed: (direction) {
        ref.read(notesProvider.notifier).deleteNote(note);
        context.showSnackBar('${note.title} deleted');
      },
      child: ListTile(
        title: Text(note.title),
        trailing: Text(note.createdAt.toFormattedString()),
        onTap: () async {
          final updatedNote = await createOrUpdateNoteDialog(context, note);
          if (updatedNote != null) {
            ref.read(notesProvider.notifier).updateNote(updatedNote);
          }
        },
      ),
    );
  }
}
