import 'package:assets_audio_player/assets_audio_player.dart';

import '../utils/constants.dart';

class AudioPlayers {
   AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  audioPlay() {
    try {
      assetsAudioPlayer.open(Audio(BACKSOUND), loopMode: LoopMode.playlist, showNotification: false,);
    } catch (e) {}
  }

  audioStop() {
    try {
      assetsAudioPlayer.open(Audio(BACKSOUND), autoStart: false, showNotification: false);
    } catch (e) {}
  }
}