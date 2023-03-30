import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/generated/assets.dart';
import 'package:iuvo/view/chat_room_screen/chat_room_screen.dart';
import 'package:iuvo/view/group_chat_screen/group_chat_screen.dart';

class DiscoverGroupScreen extends StatefulWidget {
  const DiscoverGroupScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverGroupScreen> createState() => _DiscoverGroupScreenState();
}

class _DiscoverGroupScreenState extends State<DiscoverGroupScreen> {
  int _isSelect = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: width * 0.04),
          child: Column(
            children: [
              SizedBox(
                height: width * 0.11,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _isSelect = index;
                            element.shuffle();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: _isSelect == index
                                  ? appThemeColor
                                  : Colors.white,
                              border: Border.all(color: appThemeColor)),
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          alignment: Alignment.center,
                          child: Text(
                            list[index],
                            style: TextStyle(
                                color: _isSelect == index
                                    ? Colors.white
                                    : appThemeColor),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width * 0.04,
                      );
                    },
                    itemCount: list.length),
              ),
              SizedBox(
                height: width * 0.04,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  mainAxisSpacing: width * 0.04,
                  crossAxisSpacing: width * 0.04,
                  children: element
                      .map(
                        (e) => InkWell(
                          onTap: (){
                            Get.to(const GroupChatRoomScreen());
                          },
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [

                              Container(
                                height: width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(e.image),
                                    fit: BoxFit.cover,
                                  ),
                                  //color: Colors.blueAccent,
                                ),
                                child: OverflowBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient:const LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Color(0xFF000000),
                                            Color(0x2d2d2d00)
                                          ]
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                dense: true,
                                leading: CircleAvatar(radius: width * 0.05, child: Image.asset(Assets.imageAvater)),
                                title: Text(e.name,style: TextStyle(color: Colors.white),),
                                subtitle: Text(e.groupMember,style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> list = [
    "Robbery",
    "Harassment",
    "Violation",
    "Injustice",
    "Murder",
    "Abuse",
    "Defamation",
    "PAKISTAN",
  ];
  List<DiscoverGroupModel> element = [
    DiscoverGroupModel(
        name: "No Drugs", image: Assets.imageDrugs, groupMember: "22.1K"),
    DiscoverGroupModel(
        name: "Harassment",
        image: Assets.imageHarassment,
        groupMember: "41.5K"),
    DiscoverGroupModel(
        name: "Stop Bullying",
        image: Assets.imageBullied,
        groupMember: "88.5K"),
    DiscoverGroupModel(
        name: "Defamation",
        image: Assets.imageDefamation,
        groupMember: "14.5K"),
    DiscoverGroupModel(
        name: "Injustices", image: Assets.imageJustices, groupMember: "33.8K"),
    DiscoverGroupModel(
        name: "Killer Spot", image: Assets.imageMudered, groupMember: "33.8K"),
    DiscoverGroupModel(
        name: "Pakistan", image: Assets.imagePakistan, groupMember: "88.5K"
    ),
  ];
}

class DiscoverGroupModel {
  String name;
  String groupMember;
  String image;
  DiscoverGroupModel(
      {required this.name, required this.image, required this.groupMember});
}
