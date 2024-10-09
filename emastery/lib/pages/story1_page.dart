import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/story1.dart';
import '../widgets/text_with_audio_widget.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late AudioPlayer _audioPlayer;
  late Story _story;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Inicializando a história com o texto e traduções
    _story = Story(
      content: "Every morning, Camila wakes up and heads straight to the bathroom to start her day. She steps inside and turns on the shower. As the warm water flows, she grabs the soap and washes her body, enjoying the fresh scent. Then, she takes the shampoo and carefully washes her hair, making sure to rinse out all the bubbles. After her shower, Camila picks up a soft towel from the rack and dries herself off. She walks over to the sink and prepares to brush her teeth. Camila puts some toothpaste on her toothbrush and brushes her teeth in small circles, checking her smile in the mirror. Next, Camila washes her hands with hand soap, making sure to scrub well. She dries her hands with a washcloth and then uses the toilet, remembering to flush when she’s done. Now she has to wash her hands again. Finally, Camila feels refreshed and ready for the day ahead. She hangs up her towel neatly and turns off the bathroom light. With her bathroom routine complete, she steps out feeling organized and prepared for whatever comes next.",
      translations: {
        "wakes": "acorda",
        "bathroom": "banheiro",
        "shower": "chuveiro",
        "soap": "sabão",
        // Adicione mais traduções conforme necessário
      },
    );

    // Carregar o áudio
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    // Substitua o caminho pelo caminho do seu arquivo de áudio
    await _audioPlayer.setAsset('assets/audio/seu_audio.mp3');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('História de Camila')),
      body: Center(
        child: TextWithAudioWidget(story: _story, audioPlayer: _audioPlayer),
      ),
    );
  }
}
