import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app_task/features/home/data/models/note.dart';

// best practice to use an AutoDisposeNotifierProvider
// because it will automatically dispose the state when
// the widget is removed from the widget tree

final notesProvider = AutoDisposeNotifierProvider<NotesNotifier, List<Note>>(
  NotesNotifier.new,
);

class NotesNotifier extends AutoDisposeNotifier<List<Note>> {
  @override
  build() => [];

  void addNote(Note note) => state = [...state, note];

  void updateNote(Note note) => state = state
      .map(
        (currentNote) => currentNote == note ? note : currentNote,
      )
      .toList();

  void deleteNote(Note note) => state = state
      .where(
        (currentNote) => currentNote != note,
      )
      .toList();
}
