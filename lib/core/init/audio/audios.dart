import 'package:audioplayers/audioplayers.dart';

enum OneShotSounds {
  buttonClick,
  rollDice,
  gameEnd,
  correctTell,
  wrongTell,
  passTell,
}

class Audios {
  static final Map<OneShotSounds, List<AssetSource>> oneShotSounds = {
    OneShotSounds.buttonClick: [AssetSource("sounds/ui/button_click.ogg")],
    OneShotSounds.rollDice: [AssetSource("sounds/game/roll_dice.wav")],
    OneShotSounds.gameEnd: [AssetSource("sounds/game/game_end.wav")],
    OneShotSounds.correctTell: [AssetSource("sounds/game/correct_tell.wav")],
    OneShotSounds.wrongTell: [AssetSource("sounds/game/wrong_tell.mp3")],
    OneShotSounds.passTell: [AssetSource("sounds/game/pass_tell.wav")],
  };
}
