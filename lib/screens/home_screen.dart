import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dictionary/bloc/word_bloc.dart';
import 'package:flutter_dictionary/screens/list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: BlocConsumer<DictionaryCubit, DictionaryState>(
            listener: (context, state) {
          if (state is DictionaryIsLoaded && state.words != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ListScreen(state.words!)));
          }
        }, builder: (context, state) {
          if (state is DictionaryIsLoading) {
            return const Loading();
          }

          if (state is DictionaryNotLoaded) {
            return Error(message: state.message);
          }

          if (state is DictionaryInitial) {
            return const HomeView();
          }

          return Container();
        }));
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DictionaryCubit dictionaryCubit =
        BlocProvider.of<DictionaryCubit>(context);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Spacer(),
          const Text("Dictionary App",
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              )),
          const Text("Search any word you want",
              style: TextStyle(color: Colors.white, fontSize: 14)),
          const SizedBox(
            height: 32,
          ),
          TextField(
              controller: dictionaryCubit.queryController,
              decoration: InputDecoration(
                  hintText: 'Search something...',
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.transparent)))),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  dictionaryCubit.searchForWord();
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    padding: const EdgeInsets.all(16)),
                child: const Text("Search")),
          )
        ],
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class Error extends StatelessWidget {
  final String message;

  const Error({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
