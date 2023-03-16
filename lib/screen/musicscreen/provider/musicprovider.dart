
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class MusicProvider extends ChangeNotifier
{

  String bgImage = "https://e0.pxfuel.com/wallpapers/331/708/desktop-wallpaper-fanmade-poster-pathaan-srk-shahrukhkhan.jpg";
  String centerImage = "https://djmaza.live/siteuploads/thumb/sft18/8665_resize2x_200x200.webp";

  AssetsAudioPlayer? assetsAudioPlayer;
  Duration totalDuration = Duration(seconds: 0);
  Duration currentDuration = Duration(seconds: 0);
  bool isMute = false;
  List<Audio> musicList =
      [
        Audio("assets/music/pathan.mp3"),
        Audio("assets/music/shut.mp3"),
        Audio("assets/music/meh.mp3"),
      ];


  void initMusic()
  {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer!.open(Playlist(audios: musicList),autoStart: false,showNotification: true);
    totalDurationMusic();
    currentDurationMusic();
  }
  Future<void> startMusic()async
  {
    await assetsAudioPlayer!.play();
  }

  Future<void> pauseMusic()async
  {
    await assetsAudioPlayer!.pause();
  }

  void totalDurationMusic()
  {
    assetsAudioPlayer!.current.listen((event) {totalDuration = event!.audio.duration; });
    notifyListeners();
  }

  void currentDurationMusic()
  {
    currentDuration = assetsAudioPlayer!.currentPosition.value;
    notifyListeners();
  }

  Future<void> isMuteorUnmute()
  async {
    await assetsAudioPlayer!.setVolume(isMute?1:0);
    isMute = !isMute;
    notifyListeners();
  }

  Future<void> nextSong()
  async {
    await assetsAudioPlayer!.next();
  }

  Future<void> previousSong()
  async {
    await assetsAudioPlayer!.previous();
  }






}