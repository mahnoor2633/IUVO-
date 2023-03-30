import 'package:circular_clip_route/circular_clip_route.dart';
import 'package:flutter/material.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/generated/assets.dart';
import 'package:iuvo/view/get_start_screen/build_your_community_screen.dart';
import 'package:iuvo/view/main_screen/main_screen.dart';

class ReportYourIssueScreen extends StatefulWidget {
  const ReportYourIssueScreen({Key? key}) : super(key: key);
  @override
  State<ReportYourIssueScreen> createState() => _ReportYourIssueScreenState();
}

class _ReportYourIssueScreenState extends State<ReportYourIssueScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                  builder: (_) => BuildYourCommunityScreen(),
                ));
          },
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: appThemeColor,
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.04, horizontal: width * 0.06),
          color: appThemeColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                Assets.imageReportCrime,
                scale: 1.2,
              ),
              Text(
                'Report Your Issue',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: width * 0.08),
              ),
              Column(
                children: const [
                  Center(
                    child: Text(
                      'Join iUVo where you can report any crime with an anonymous identity. Report the criminal activity free of free from the hassle, embarrassment or dread of being mistreated or exploited. You can also choose which authority you would like to bring attention of to this crime. Our team will make sure to bring justice to our users as',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: width * 0.04,
              )
            ],
          ),
        ),
      ),
    );
  }
}
