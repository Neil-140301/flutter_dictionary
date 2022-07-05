import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dictionary/models/word_model.dart';
import 'package:flutter_dictionary/repository/word_repo.dart';

abstract class DictionaryState {}

class DictionaryInitial extends DictionaryState {}

class DictionaryIsLoading extends DictionaryState {}

class DictionaryIsLoaded extends DictionaryState {
  final List<Word>? words;

  DictionaryIsLoaded({this.words});
}

class DictionaryNotLoaded extends DictionaryState {
  final String message;

  DictionaryNotLoaded(this.message);
}

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _wordRepo;
  final TextEditingController queryController = TextEditingController();

  DictionaryCubit(this._wordRepo) : super(DictionaryInitial());

  Future searchForWord() async {
    emit(DictionaryIsLoading());

    try {
      List<Word> words =
          await _wordRepo.getWordsFromDictionary(queryController.text);
      emit(DictionaryIsLoaded(words: words));
    } on Exception catch (e) {
      emit(DictionaryNotLoaded(e.toString()));
    }
  }

  void resetApp() {
    queryController.text = '';
    emit(DictionaryInitial());
  }
}
