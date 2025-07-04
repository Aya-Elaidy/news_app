
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/routes_manager/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigate();
  }

  void _navigate() {
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    // });
    /// duration -> build thread
    /// navigate
    Timer(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacementNamed(context, RoutesManager.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("ana da5alt el build  ");

    return Scaffold(
      backgroundColor: ColorsManager.black17,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 3, child:  Image.asset(AssetsManager.logo)),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(AssetsManager.branding),
                SizedBox(height: 4),


              ],
            ),
          ),

          //   Expanded(flex: 2, child: Image.asset(ImageAssets.brandingS),),
          //   Expanded(
          //       flex:1,child: Center(child: Text('Supervised by Mohamed Nabil',style: Theme.of(context).textTheme.bodySmall,)))
          //
        ],
      ),
    );
  }
}
