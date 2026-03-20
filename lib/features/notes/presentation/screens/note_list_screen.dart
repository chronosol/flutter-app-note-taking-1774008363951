import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/note_controller.dart';
import '../widgets/note_card_widget.dart';

class NoteListScreen extends ConsumerWidget {
  const NoteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsyncValue = ref.watch(noteControllerProvider);

    return notesAsyncValue.when(
      data: (notes) => Scaffold(
        appBar: AppBar(title: const Text('Notes')),
        body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return NoteCardWidget(note: note);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: Add navigation to the note creation/editing page
          },
          child: const Icon(Icons.add),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Something went wrong!'),
              TextButton(
                onPressed: () => ref.refresh(noteControllerProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
