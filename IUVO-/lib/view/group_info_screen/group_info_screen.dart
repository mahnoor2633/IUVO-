import 'package:flutter/material.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/generated/assets.dart';

class GroupInfoScreen extends StatefulWidget {
  const GroupInfoScreen({Key? key}) : super(key: key);

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                width: width,
                height: width * 0.6,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: width,
                      height: width * 0.6,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.imageJustices),
                            fit: BoxFit.cover),
                      ),
                      child: Container(
                        width: width,
                        height: width * 0.6,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                              Colors.black38,
                              Colors.black12,
                            ])),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: width * 0.05),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: width * 0.08,
                          child: Image.asset(Assets.imageAvater),
                        ),
                        title: Text(
                          "Group Name",
                          style: TextStyle(
                              fontSize: width * 0.07, color: Colors.white),
                        ),
                        subtitle: Text(
                          "1.5K member",
                          style: TextStyle(
                              fontSize: width * 0.05, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: AppBar(
                  bottom: TabBar(
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(
                        text: "Doc",
                      ),
                      Tab(
                       text: "Image",
                      ),
                      Tab(
                        text: "Video",
                      ),
                    ],
                  ),
                ),
              ),

              // create widgets for each tab bar here
              Expanded(
                child: TabBarView(
                  children: [
                    // first tab bar view widget
                    Container(
                      padding:EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
                      child: GridView.count(crossAxisCount: 3,
                        crossAxisSpacing: width * 0.04,
                        mainAxisSpacing: width * 0.04,
                        children: list.map((e) => Container(
                          // color: appThemeColor,
                          decoration: BoxDecoration(
                            border: Border.all(color: appThemeColor),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Icon(Icons.document_scanner_outlined,size: width * 0.1,)),)).toList(),
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
                      child: GridView.count(crossAxisCount: 3,
                        crossAxisSpacing: width * 0.04,
                        mainAxisSpacing: width * 0.04,
                        children: list.map((e) => Container(child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(e,fit: BoxFit.cover,)),)).toList(),
                      ),
                    ),Container(
                      padding:EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
                      child: GridView.count(crossAxisCount: 3,
                        crossAxisSpacing: width * 0.04,
                        mainAxisSpacing: width * 0.04,
                        children: list.map((e) => Container(
                          // color: appThemeColor,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.imageJustices),
                                fit: BoxFit.cover),
                              border: Border.all(color: appThemeColor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Icon(Icons.play_arrow,size: width * 0.13,color: Colors.white,)),)).toList(),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  List<String>list=[
    Assets.imageDrugs,
    Assets.imageDrugs,
    Assets.imageDrugs,
    Assets.imageDrugs,
    Assets.imageDrugs,
    Assets.imageDrugs,
    Assets.imageDrugs,
    Assets.imageDrugs,
    Assets.imageDrugs,
    Assets.imageDrugs,
    Assets.imageDrugs,
    Assets.imageDrugs,
    Assets.imageDrugs,
  ];
}
