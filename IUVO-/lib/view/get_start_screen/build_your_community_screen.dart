import 'package:circular_clip_route/circular_clip_route.dart';
import 'package:flutter/material.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/generated/assets.dart';
import 'package:iuvo/view/get_start_screen/stand_for_justice_screen.dart';
import 'package:iuvo/view/main_screen/main_screen.dart';
import 'package:iuvo/view/signUp_screen/signup_screen.dart';

class BuildYourCommunityScreen extends StatefulWidget {
  @override
  State<BuildYourCommunityScreen> createState() =>
      _BuildYourCommunityScreenState();
}

class _BuildYourCommunityScreenState extends State<BuildYourCommunityScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  CircularClipRoute<void>(
                    reverseCurve: Curves.easeInOutCirc,
                    curve: Curves.easeInCirc,
                    transitionDuration: const Duration(milliseconds: 700),
                    expandFrom: context,
                    builder: (_) =>  StandForJusticeScreen(),
                  ));
            },
            child: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: appThemeColor,
            ),
          ),
          body: Container(
            color: appThemeColor,
            padding: EdgeInsets.symmetric(
                vertical: width * 0.04, horizontal: width * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Image//

                Image.asset(
                  Assets.imageCommunity,
                  scale: 1.2,
                ),
                Center(
                  child: Text(
                    'Build Your Community',
                    style: TextStyle(
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const Center(
                  child: Text(
                    'Here at iUVo you can be a part of a diverse and anonymous community where you can easily and freely share your problems with other people. You can communicate, share and alert others as well as give to the community by helping them out with suggestions and support. We at iUVo help our users not only by taking care of their concerns by also providing them with moral support from people all around by giving them a voice.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: width *0.04,)
              ],
            ),
          )),
    );
  }
}
