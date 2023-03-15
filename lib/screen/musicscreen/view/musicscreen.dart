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
    Provider.of<MusicProvider>(context,listen: false).initMusic();
  }

  @override
  Widget build(BuildContext context) {

    musicProviderFalse = Provider.of(context,listen: false);
    musicProviderTrue = Provider.of(context,listen: true);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.network("https://e0.pxfuel.com/wallpapers/331/708/desktop-wallpaper-fanmade-poster-pathaan-srk-shahrukhkhan.jpg",height: double.infinity,width: double.infinity,fit:  BoxFit.cover,),
            Center(child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network("https://djmaza.live/siteuploads/thumb/sft18/8665_resize2x_200x200.webp",height: 150,width: 150,fit: BoxFit.cover,))),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                    border: Border.all(color: Colors.white,width: 1.5),
                    borderRadius: BorderRadius.circular(30),
                    //color: Colors.black87,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () {musicProviderFalse!.startMusic();}, icon: Icon(Icons.play_arrow,color: Colors.white,),),
                      IconButton(onPressed: () {musicProviderFalse!.pauseMusic();}, icon: Icon(Icons.pause,color: Colors.white,),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
