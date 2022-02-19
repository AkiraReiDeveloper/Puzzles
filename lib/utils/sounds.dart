/*import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Sounds{

  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  AudioCache cache = new AudioCache();

  void playLocalMusic(String assets) async {
    //audioPlayer?.stop();
    audioPlayer = await cache.loop(assets);
  }

  void playLocalEffects(String assets) async {
    AudioCache cache = new AudioCache();
    await cache.play(assets);
  }

  void stopLocalMusic() async {
    audioPlayer.stop();
  }
}*/