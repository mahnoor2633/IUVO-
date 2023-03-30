
import 'package:flutter/material.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/generated/assets.dart';

class ChatGptMessageTile extends StatelessWidget {
  const ChatGptMessageTile({
    Key? key,
    required this.isMe,
    required this.width,
    required this.message,
    required this.time,
  }) : super(key: key);

  final bool isMe;
  final double width;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:isMe ?MainAxisAlignment.end:MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isMe?Container():CircleAvatar(
          child: Image.asset(Assets.imageGpt,scale: 20,),
        ),
        SizedBox(width: width * 0.04,),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.04, horizontal: width * 0.04),
          width: width * 0.7,
          decoration: BoxDecoration(
            color: isMe?appThemeColor:Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(-2, 2),
                  blurRadius: 7,
                  spreadRadius: 5),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(message,
                style: TextStyle(color: isMe?Colors.white:Colors.black),
              ),
              SizedBox(height: width * 0.03,),
              Text(time,textAlign: TextAlign.right,style: TextStyle(color:isMe ?Colors.white:Colors.grey),),
            ],
          ),
        ),
        SizedBox(width: width * 0.04,),
        isMe?CircleAvatar(
          child: Image.asset(Assets.imageAvater),
        ):Container(),
      ],
    );
  }
}
