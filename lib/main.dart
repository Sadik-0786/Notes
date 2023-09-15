
import 'package:flutter/material.dart';
import 'package:note_app/provider/notes_provider.dart';
import 'package:note_app/screenes/splace_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ChangeNotifierProvider(create:(context)=> NotesProvider(),
  child: const MyApp(),));
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Note App",
      home:SplaceScreen()
    );
  }
}
