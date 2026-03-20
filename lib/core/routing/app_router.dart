import 'package:go_router/go_router.dart';
import '../../features/notes/presentation/screens/note_list_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[  
    GoRoute(
      path: '/',
      builder: (context, state) => const NoteListScreen(),
    ),
    // Add more routes here
  ],
);
