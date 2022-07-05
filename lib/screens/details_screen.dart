import 'package:flutter/material.dart';
import 'package:flutter_dictionary/models/word_model.dart';

class DetailsScreen extends StatelessWidget {
  final Word word;

  const DetailsScreen(this.word, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              word.word,
              style: const TextStyle(color: Colors.white, fontSize: 36),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final meaning = word.meanings[index];
                final definations = meaning.definitions;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meaning.partOfSpeech,
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white24),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Defination: ${definations[index].definition}",
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Sentence: ${definations[index].example ?? ''}",
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: definations.length)
                  ],
                );
              },
              itemCount: word.meanings.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
