import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/components/widget/chat_textfield.dart';
import 'package:iuvo/components/widget/messageTitleSorChatGpt.dart';
import 'package:iuvo/generated/assets.dart';

class SmartChatScreen extends StatefulWidget {
  const SmartChatScreen({Key? key}) : super(key: key);

  @override
  State<SmartChatScreen> createState() => _SmartChatScreenState();
}

class _SmartChatScreenState extends State<SmartChatScreen> {
  TextEditingController controller=TextEditingController();
  String message="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ";
  String time="10:00 PM";
  bool isMe=false;
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(),icon: Icon(Icons.arrow_back),),
        title: Row(
          children: [
            CircleAvatar(
              child: Image.asset(Assets.imageAvater),
            ),
            SizedBox(width: width * 0.04,),
            const Text("Anonymous")
          ],
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
          child: ListView.separated(itemBuilder: (context,index){return ChatGptMessageTile(isMe: list[index].isMe, width: width, message: list[index].message, time: list[index].time);}, separatorBuilder: (context,index){return SizedBox(height: width * 0.04,);}, itemCount: list.length)
      ),
    );
  }
  List<Message>list=[
    Message(message: "Hey there! I am your friendly, helping chatbot. What would you like to know!?", time: "12:00 PM", isMe: false),
  ];
}

class Message{
  String message;
  String time;
  bool isMe;
  Message({required this.message,required this.time,required this.isMe});
}
