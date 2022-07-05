import 'dart:convert';

List<Word> wordFromJson(String str) =>
    List<Word>.from(json.decode(str).map((x) => Word.fromJson(x)));

String wordToJson(List<Word> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Word {
  final String word;
  final String? phonetic;
  final List<Phonetic> phonetics;
  final String? origin;
  final List<Meaning> meanings;

  Word({
    required this.word,
    this.phonetic,
    required this.phonetics,
    this.origin,
    required this.meanings,
  });

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        word: json["word"],
        phonetic: json["phonetic"],
        phonetics: json['phonetics'] != null
            ? List<Phonetic>.from(
                json["phonetics"].map((x) => Phonetic.fromJson(x)))
            : [],
        origin: json["origin"],
        meanings: List<Meaning>.from(
            json["meanings"].map((x) => Meaning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "phonetic": phonetic,
        "phonetics": List<dynamic>.from(phonetics.map((x) => x.toJson())),
        "origin": origin,
        "meanings": List<dynamic>.from(meanings.map((x) => x.toJson())),
      };
}

class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  final String partOfSpeech;
  final List<Definition> definitions;

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(
            json["definitions"].map((x) => Definition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions.map((x) => x.toJson())),
      };
}

class Definition {
  Definition({
    required this.definition,
    this.example,
    required this.synonyms,
    required this.antonyms,
  });

  final String definition;
  final String? example;
  final List<dynamic> synonyms;
  final List<dynamic> antonyms;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
        example: json["example"],
        synonyms: List<dynamic>.from(json["synonyms"].map((x) => x)),
        antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "example": example,
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms.map((x) => x)),
      };
}

class Phonetic {
  Phonetic({
    this.text,
    this.audio,
  });

  final String? text;
  final String? audio;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio,
      };
}
