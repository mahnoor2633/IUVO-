import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/components/widget/chat_textfield.dart';
import 'package:iuvo/components/widget/messageTile.dart';
import 'package:iuvo/generated/assets.dart';
import 'package:iuvo/view/group_info_screen/group_info_screen.dart';

class GroupChatRoomScreen extends StatefulWidget {
  const GroupChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<GroupChatRoomScreen> createState() => _GroupChatRoomScreenState();
}

class _GroupChatRoomScreenState extends State<GroupChatRoomScreen> {
  TextEditingController controller=TextEditingController();
  String message="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ";
  String time="10:00 PM";
  bool isMe=false;
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(onPressed: ()=>Get.back(),icon:const  Icon(Icons.arrow_back),),
        title: InkWell(
          onTap: ()=>Get.to(const GroupInfoScreen()),
          child: Row(
            children: [
              CircleAvatar(
                child: Image.asset(Assets.imageAvater),
              ),
              SizedBox(width: width * 0.04,),
              const Text("Group Name")
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: width * 0.2,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: width * 0.04,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: appThemeColor,
              child: Icon(Icons.more_horiz_outlined,color: Colors.white,),),

            SizedBox(
                width: width * 0.6,
                child: ChatTextField(controller: controller, maxline: 1, hintText: "Type....", width: width))
            ,CircleAvatar(
              backgroundColor: appThemeColor,
              child: Icon(Icons.send,color: Colors.white,),),
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.04, horizontal: width * 0.04),
          child: ListView.separated(itemBuilder: (context,index){return MessageTile(isMe: list[index].isMe, width: width, message: list[index].message, time: list[index].time);}, separatorBuilder: (context,index){return SizedBox(height: width * 0.04,);}, itemCount: list.length)
      ),
    );
  }
  List<Message>list=[
    Message(message: "Please stay safe everyone!!!", time: "12:00 PM", isMe: false),
    Message(message: "My condolences to everyone from iUVo Town. Bless your souls.", time: "12:50 PM", isMe: true),
    Message(message: "This is what is happening in downtown iUVo street. I cannot even fathom the tought of experiancing something like this. Please everyone be aware and stay safe. This is so ignorant of them to do this and publibly on top of that. We need to unite as a society so that we can kick this out of our system and work it out to make us a healthy society!", time: "12:00 PM", isMe: false),
    Message(message: "I agree! if we don't stand upto this now we will always have to bear it. We should not turn a blind eye to this problem. Let's do something about it. This is our country it is our responsibility!!", time: "12:05 PM", isMe: true),
    Message(message: "Yes I agree! We should make a change for our society and for our future.", time: "1:00 PM", isMe:false),
    Message(message: "This sounds right. Something needs to be done and it needs to be done immediately.", time: "2:00 PM", isMe: false),
  ];
}

class Message{
  String message;
  String time;
  bool isMe;
  Message({required this.message,required this.time,required this.isMe});
}
