
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/components/widget/iuvotextfield.dart';
import 'package:iuvo/generated/assets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController userName=TextEditingController();
  TextEditingController country=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text('Edit Profile'),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              // ignore: prefer_const_constructors
              child: Text(
                'Delete Profile',
                style: const TextStyle(color: appThemeColor),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: width * 0.07,horizontal: width * 0.04),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: ()async{
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  },
                  child: CircleAvatar(
                    radius: width * 0.2,
                    child: Image.asset(Assets.imageAvater,fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: width * 0.05,),
                SizedBox(height: width * 0.05,),
                SizedBox(height: width * 0.05,),
                SizedBox(height: width * 0.05,),
                SizedBox(height: width * 0.05,),
                IuvoTextField(
                    obscureText: false,
                    controller: name,
                    hintText: "XXXAA DDDDMM",
                    labelText: "Name"),
                SizedBox(height: width * 0.05,),
                IuvoTextField(
                    obscureText: false,
                    controller: userName,
                    hintText: "XXxx.0077",
                    labelText: "Username"),
                SizedBox(height: width * 0.05,),
                IuvoTextField(
                    obscureText: false,
                    controller: country,
                    hintText: "Pakistan",
                    labelText: "Country"),
                SizedBox(height: width * 0.05,),
                SizedBox(height: width * 0.05,),
                SizedBox(height: width * 0.05,),
                SizedBox(height: width * 0.05,),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

