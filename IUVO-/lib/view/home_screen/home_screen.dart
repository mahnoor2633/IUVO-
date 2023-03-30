import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/generated/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool like1 = true;
  bool like2 = true;
  bool follow1=false;
  bool follow2=false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: width * 0.04),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      offset: const Offset(-2, 2),
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 7,
                      spreadRadius: 5)
                ]),
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.04, horizontal: width * 0.04),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          child: Image.asset(Assets.imageAvater),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          width: width * 0.7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey)),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Share Your Thoughts",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: width * 0.02),
                      child: const Divider(
                        thickness: 1.5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: ()async{
                            final ImagePicker _picker = ImagePicker();
                            final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.imagePicture,
                                scale: 18,
                              ),
                              SizedBox(
                                width: width * 0.04,
                              ),
                              Text(
                                "Images",
                                style: TextStyle(fontSize: width * 0.05),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                            height: width * 0.08,
                            child: const VerticalDivider(
                              thickness: 1.5,
                            )),
                        InkWell(
                          onTap: ()async{
                            final ImagePicker _picker = ImagePicker();
                            final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.imageMultimedia,
                                scale: 18,
                              ),
                              SizedBox(
                                width: width * 0.04,
                              ),
                              Text(
                                "Videos",
                                style: TextStyle(fontSize: width * 0.05),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: width * 0.04,
                  ),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                          child: Image.asset(
                        Assets.imageAvater,
                      )),
                      title: Row(
                        children: [
                          const Text("Anonymous"),
                          SizedBox(width: width * 0.04,),
                          Image.asset(
                            Assets.imagePakistan,
                            scale: 25,
                          ),                        ],
                      ),
                      subtitle: const Text("Injustice"),
                      trailing: InkWell(
                        onTap: (){
                          setState(() {
                            follow1 = !follow1;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: width * 0.01, horizontal: width * 0.04),
                          decoration: BoxDecoration(
                            color: follow1?appThemeColor:Colors.white,
                              border: Border.all(color: appThemeColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Follow",
                            style: TextStyle(color: follow1?Colors.white:appThemeColor),
                          ),
                        ),
                      )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    color: Colors.white,
                    alignment: Alignment.topLeft,
                    child: const Text("No Justice! No Peace!!"),
                  ),
                  SizedBox(
                    height: width * 0.02,
                  ),
                  Image.asset(Assets.imageJustices),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: width * 0.04,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              like1 = !like1;
                            });
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                like1
                                    ? Assets.imageFillArrow
                                    : Assets.imageArrow,
                                scale: 23,
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Text(
                                "1.45K",
                                style: TextStyle(fontSize: width * 0.05),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              like1 = !like1;
                            });
                          },
                          child: Row(
                            children: [
                              RotatedBox(
                                  quarterTurns: 90,
                                  child: Image.asset(
                                    !like1
                                        ? Assets.imageFillArrow
                                        : Assets.imageArrow,
                                    scale: 23,
                                  )),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Text(
                                "1.22K",
                                style: TextStyle(fontSize: width * 0.05),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              Assets.imageComment,
                              scale: 23,
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Text(
                              "2.31K",
                              style: TextStyle(fontSize: width * 0.05),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: width * 0.04,
                  ),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                          child: Image.asset(
                        Assets.imageAvater,
                      )),
                      title: Row(
                        children: [
                          const Text("Anonymous"),
                          SizedBox(width: width * 0.04,),
                          Image.asset(
                            Assets.imagePakistan,
                            scale: 25,
                          ),
                        ],
                      ),
                      subtitle: const Text("Drugs"),
                      trailing:  InkWell(
                        onTap: (){
                          setState(() {
                            follow2 = !follow2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: width * 0.01, horizontal: width * 0.04),
                          decoration: BoxDecoration(
                              color: follow2?appThemeColor:Colors.white,
                              border: Border.all(color: appThemeColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Follow",
                            style: TextStyle(color: follow2?Colors.white:appThemeColor),
                          ),
                        ),
                      )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    color: Colors.white,
                    alignment: Alignment.topLeft,
                    child: const Text("Say No!! To Drugs"),
                  ),
                  SizedBox(
                    height: width * 0.02,
                  ),
                  Image.asset(Assets.imageDrugs),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: width * 0.04,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              like2 = !like2;
                            });
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                like2
                                    ? Assets.imageFillArrow
                                    : Assets.imageArrow,
                                scale: 23,
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Text(
                                "1.45K",
                                style: TextStyle(fontSize: width * 0.05),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              like2 = !like2;
                            });
                          },
                          child: Row(
                            children: [
                              RotatedBox(
                                  quarterTurns: 90,
                                  child: Image.asset(
                                    !like2
                                        ? Assets.imageFillArrow
                                        : Assets.imageArrow,
                                    scale: 23,
                                  )),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Text(
                                "1.22K",
                                style: TextStyle(fontSize: width * 0.05),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              Assets.imageComment,
                              scale: 23,
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Text(
                              "2.31K",
                              style: TextStyle(fontSize: width * 0.05),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
