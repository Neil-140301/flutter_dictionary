import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dictionary/bloc/word_bloc.dart';
import 'package:flutter_dictionary/repository/word_repo.dart';
import 'package:flutter_dictionary/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DictionaryCubit>(
        create: (context) => DictionaryCubit(WordRepository()),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ));
  }
}
