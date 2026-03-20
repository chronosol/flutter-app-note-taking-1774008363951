import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';

class NoteController extends AsyncNotifier<List<Note>> {
  @override
  Future<List<Note>> build() async {
    return ref.read(noteRepositoryProvider).getAllNotes();
  }

  Future<void> add(Note note) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        await ref.read(noteRepositoryProvider).addNote(note);
        return ref.read(noteRepositoryProvider).getAllNotes();
      },
    );
  }

  Future<void> update(Note note) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        await ref.read(noteRepositoryProvider).updateNote(note);
        return ref.read(noteRepositoryProvider).getAllNotes();
      },
    );
  }

  Future<void> delete(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        await ref.read(noteRepositoryProvider).deleteNote(id);
        return ref.read(noteRepositoryProvider).getAllNotes();
      },
    );
  }
}

final noteControllerProvider =
    AsyncNotifierProvider<NoteController, List<Note>>(NoteController.new);

final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  return NoteRepositoryImpl();
});
