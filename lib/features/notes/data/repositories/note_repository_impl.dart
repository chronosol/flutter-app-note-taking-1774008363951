import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  @override
  Future<List<Note>> getAllNotes() async {
    // TODO: Implement fetching notes from cloud and local storage
    return [];
  }

  @override
  Future<void> addNote(Note note) async {
    // TODO: Implement adding note to cloud and local storage
  }

  @override
  Future<void> updateNote(Note note) async {
    // TODO: Implement updating note in cloud and local storage
  }

  @override
  Future<void> deleteNote(String id) async {
    // TODO: Implement deleting note from cloud and local storage
  }
}
