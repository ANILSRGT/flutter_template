import 'dart:math';

import 'package:audioplayers/audioplayers.dart';

import '../cache/cache_manager.dart';
import '../cache/icache.dart';
import 'audios.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._init();
  static AudioManager get instance => _instance;

  AudioManager._init();

  List<AudioPlayer> audioPlayers = [];

  Future<void> init() async {
    await createPlayer();
  }

  Future<AudioPlayer> createPlayer() async {
    double vol = getVolume();
    AudioPlayer player = AudioPlayer();
    await player.setReleaseMode(ReleaseMode.stop);
    await player.setVolume(vol);
    audioPlayers.add(player);
    return player;
  }

  ///[volume] must be between 0.0 and 1.0
  Future<void> setVolume(double volume) async {
    volume = volume.clamp(0.0, 1.0);
    for (var element in audioPlayers) {
      await element.setVolume(volume);
    }
    await CacheManager.instance.setInt(CacheKey.soundVolume, (volume * 100).toInt());
  }

  double getVolume() {
    int? vol = CacheManager.instance.getInt(CacheKey.soundVolume, defaultValue: 100);
    return vol! / 100;
  }

  Future<void> oneShot(OneShotSounds sound) async {
    int randSeedMilliseconds = DateTime.now().millisecondsSinceEpoch;
    int randSound = Random(randSeedMilliseconds).nextInt(Audios.oneShotSounds[sound]!.length);
    Source source = Audios.oneShotSounds[sound]![randSound];

    List<AudioPlayer> players = [...audioPlayers];
    for (var element in players) {
      if (element.state != PlayerState.playing) {
        element.dispose();
        audioPlayers.remove(element);
      }
    }

    AudioPlayer newPlayer = await createPlayer();
    await newPlayer.play(source);
  }
}
