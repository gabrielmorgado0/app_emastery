import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:just_audio/just_audio.dart';
import '../models/1.dart';

class TextWithAudioWidget extends StatefulWidget {
  final Story story;
  final AudioPlayer audioPlayer;

  TextWithAudioWidget({required this.story, required this.audioPlayer});

  @override
  _TextWithAudioWidgetState createState() => _TextWithAudioWidgetState();
}

class _TextWithAudioWidgetState extends State<TextWithAudioWidget> {
  int _highlightedWordIndex = -1;

  @override
  void initState() {
    super.initState();

    // Escuta a posição do áudio e atualiza o índice da palavra destacada
    widget.audioPlayer.positionStream.listen((position) {
      setState(() {
        _highlightedWordIndex = getWordIndexAtTime(position);
      });
    });
  }

  // Função que calcula o índice da palavra no tempo atual do áudio
  int getWordIndexAtTime(Duration currentPosition) {
    // Você pode implementar a lógica para calcular o índice da palavra com base na posição do áudio
    // Isso pode envolver uma estrutura de dados que associa tempos específicos a palavras
    // Exemplo básico: retornar um índice fixo ou calcular com base em uma lista de tempos
    return 0; // Substitua isso pela lógica real
  }

  // Função para dividir o texto em palavras
  List<String> splitWords(String content) {
    return content.split(' '); // Divide o texto em palavras
  }

  // Função para sublinhar a palavra no índice correto
  Widget buildTextWithHighlight() {
    List<String> words = splitWords(widget.story.content);
    return RichText(
      text: TextSpan(
        children: List.generate(words.length, (index) {
          bool isHighlighted = index == _highlightedWordIndex;
          return TextSpan(
            text: words[index] + ' ',
            style: TextStyle(
              color: isHighlighted ? Colors.blue : Colors.black,
              decoration: isHighlighted ? TextDecoration.underline : TextDecoration.none,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              // Ação de clicar na palavra para mostrar tradução
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Tradução: ${widget.story.translations[words[index]] ?? 'Não disponível'}'),
                      IconButton(
                        icon: Icon(Icons.volume_up),
                        onPressed: () {
                          // Tocar áudio da palavra
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildTextWithHighlight();
  }
}
