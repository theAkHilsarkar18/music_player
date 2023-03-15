
import 'package:flutter/material.dart';
import 'package:music_player/screen/musicscreen/provider/musicprovider.dart';
import 'package:music_player/screen/musicscreen/view/musicscreen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MusicProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => MusicScreen(),
        },
      ),
    ),
  );
}