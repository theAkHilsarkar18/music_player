import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/screen/musicscreen/provider/musicprovider.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  MusicProvider? musicProviderTrue;
  MusicProvider? musicProviderFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<MusicProvider>(context, listen: false).initMusic();
  }

  @override
  Widget build(BuildContext context) {
    musicProviderFalse = Provider.of(context, listen: false);
    musicProviderTrue = Provider.of(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.network(
              "${musicProviderTrue!.bgImage}",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "${musicProviderTrue!.centerImage}",
                  height: 130,
                  width: 130,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PlayerBuilder.currentPosition(
                      player: musicProviderFalse!.assetsAudioPlayer!,
                      builder: (context, position) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Slider(
                            activeColor: Colors.white,
                            inactiveColor: Colors.white54,
                            max: musicProviderTrue!.totalDuration.inSeconds
                                .toDouble(),
                            value: position.inSeconds.toDouble(),
                            onChanged: (value) {
                              musicProviderFalse!.assetsAudioPlayer!
                                  .seek(Duration(seconds: value.toInt()));
                            },
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text("${position}",
                                  style: TextStyle(color: Colors.white)),
                              Spacer(),
                              Text(
                                  "${musicProviderTrue!.totalDuration.toString()}",
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(30),
                        //color: Colors.black87,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              musicProviderFalse!.previousSong();
                            },
                            icon:
                                Icon(Icons.skip_previous, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              musicProviderFalse!.startMusic();
                            },
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              musicProviderFalse!.pauseMusic();
                            },
                            icon: Icon(
                              Icons.pause,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                musicProviderFalse!.isMuteorUnmute();
                              },
                              icon: musicProviderTrue!.isMute
                                  ? Icon(
                                      Icons.volume_mute,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.volume_mute_outlined,
                                      color: Colors.white,
                                    )),
                          IconButton(
                            onPressed: () {
                              musicProviderFalse!.nextSong();
                            },
                            icon: Icon(Icons.skip_next, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
