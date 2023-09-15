import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/screenes/home_screen.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds:3000),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const HomePage()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color:Colors.black ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/spaceScreen.json',height: 200,width: 200,),
           const SizedBox(height: 30,),
            AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  '...Write Your thoughts...',
                  textStyle: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                ScaleAnimatedText(
                  '...Notes...',
                  textStyle: const TextStyle(fontSize: 44.0,fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
