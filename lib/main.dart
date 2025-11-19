import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:se7ty/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Se7ty());
}

class Se7ty extends StatelessWidget {
  const Se7ty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
