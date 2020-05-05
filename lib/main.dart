import 'package:flutter/material.dart';
import 'package:idea/view/view.dart';
import 'package:mvc_application/view.dart' show App, AppView;

void main() => runApp(IdeaApp());

class IdeaApp extends App {
  // Allows for hot reloads.
  @override
  createView() => MyApp();
}

class MyApp extends AppView {
  MyApp() : super(
    home: RandomIdeas(),
    debugShowCheckedModeBanner: false,
  );
}
