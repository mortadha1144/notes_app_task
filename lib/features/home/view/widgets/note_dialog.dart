
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes_app_task/features/home/data/models/note.dart';


/// this function will show a dialog to create or update a note
/// it will return a Future<Note?>, which will be null if the user
/// cancels the dialog, or the note if the user saves it
/// if the note is an existing note, it will be passed as a parameter
/// and then it will be updated
/// if the note is null, a new note will be created

Future<Note?> createOrUpdateNoteDialog(
  BuildContext context, [
  Note? existingNote,
]) {
  return showDialog(
    context: context,
    builder: (context) => NoteDialog(existingNote: existingNote),
  );
}

class NoteDialog extends HookWidget {
  const NoteDialog({
    super.key,
    this.existingNote,
  });

  final Note? existingNote;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);
    final titleController = useTextEditingController();
    titleController.text = existingNote?.title ?? '';
    return AlertDialog(
      title: const Text('Add Note'),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: 'Title',
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter a title';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (!formKey.currentState!.validate()) return;
            if (existingNote != null) {
              // have existing note
              final newNote = existingNote!.updated(titleController.text);
              Navigator.of(context).pop(
                newNote,
              );
            } else {
              // no existing note, create new note
              Navigator.of(context).pop(
                Note(title: titleController.text),
              );
            }
          },
          child: const Text('Save'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        )
      ],
    );
  }
}