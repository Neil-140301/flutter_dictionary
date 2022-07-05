import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dictionary/bloc/word_bloc.dart';
import 'package:flutter_dictionary/models/word_model.dart';
import 'package:flutter_dictionary/repository/word_repo.dart';
import 'package:flutter_dictionary/screens/details_screen.dart';
import 'package:strings/strings.dart';

class ListScreen extends StatelessWidget {
  final List<Word> words;

  const ListScreen(this.words, {super.key});

  goBack(BuildContext context) {
    BlocProvider.of<DictionaryCubit>(context).resetApp();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => goBack(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dictionary Results"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
          elevation: 0,
          leading: IconButton(
              onPressed: () => goBack(context),
              icon: const Icon(Icons.arrow_back)),
        ),
        backgroundColor: Colors.blueGrey[900],
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(words[index])));
                },
                leading: const Icon(
                  Icons.adf_scanner,
                  color: Colors.white,
                ),
                title: Text(capitalize(words[index].word),
                    style: const TextStyle(
                      color: Colors.white,
                    )),
              );
            },
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                ),
            itemCount: words.length),
      ),
    );
  }
}
