
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/components/widget/chat_textfield.dart';
import 'package:iuvo/components/widget/iuvotextfield.dart';
import 'package:iuvo/generated/assets.dart';

class CreateNewReportScreen extends StatefulWidget {
  const CreateNewReportScreen({super.key});

  @override
  State<CreateNewReportScreen> createState() => _CreateNewReportScreenState();
}

class _CreateNewReportScreenState extends State<CreateNewReportScreen> {
  TextEditingController subject=TextEditingController();
  TextEditingController country=TextEditingController();
  TextEditingController description=TextEditingController();
  // Initial Selected Value
  String dropdownvalue = 'Robbery';

  // List of items in our dropdown menu
  var items = [
    "Robbery",
    "Harassment",
    "Violation",
    "Injustice",
    "Abuse",
    "Defamation",
  ];

  String dropdownvalue1 = 'Police Officer';

  // List of items in our dropdown menu
  var items1 = [
    "Police Officer",
    "Human Resources",
    "Fire Truck",
    "Child Protective Services",
    "Law Firm",
  ];

  String countryText = 'Select Country';

  onChange(String? newValue) {
    setState(() {
      dropdownvalue = newValue!;
    });
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text("New report"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
          onPressed: () {

            Navigator.pop(context);

          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(-2, 2),
                          blurRadius: 7,
                          spreadRadius: 5)
                    ],
                  ),
                  child: DropdownButton(
                    underline: Container(),
                    isExpanded:true,
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: onChange
                  ),
                ),
                SizedBox(height: width * 0.04,),
                IuvoTextField(
                    obscureText: false,
                    controller: subject,
                    hintText: "Bank Robbery",
                    labelText: "Subject Of Report"),
                SizedBox(height: width * 0.04,),
                InkWell(
                  onTap: () => showCountryPicker(
                    context: context,
                    showPhoneCode:
                    true, // optional. Shows phone code before the country name.
                    onSelect: (country) {
                      print('Select country: ${country.displayName}');
                      countryText = country.displayName;
                      setState(() {});
                    },
                  ),
                  child: IgnorePointer(
                      ignoring: true,
                      child: IuvoTextField(
                        suffixIcon: Icon(Icons.location_on),
                          obscureText: false,
                          controller: country,
                          hintText: "iUVo Land",
                          labelText: countryText)),
                ),
                SizedBox(height: width * 0.04,),
                TextField(
                  controller: description,
                  maxLines: null,
                  decoration:const InputDecoration(
                      border:  OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.teal)),
                      hintText: "Describe Your Issue",
                      labelText:"Describe Here",
                      suffixStyle: TextStyle(color: appThemeColor)),
                ),
                SizedBox(height: width * 0.04,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(-2, 2),
                          blurRadius: 7,
                          spreadRadius: 5)
                    ],
                  ),
                  child: DropdownButton(
                      underline: Container(),
                      isExpanded:true,
                      value: dropdownvalue1,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items1.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue1 = newValue!;
                        });
                      }
                  ),
                ),
                SizedBox(height: width * 0.08,),
                Container(
                  height: width * 0.5,
                  padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    border: Border.all(color: appThemeColor)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(Assets.imageUpload),
                      const Text(
                        "Upload File",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w200),
                      ),
                      const Text(
                        "Attach your documents as proof. if any available type (PDF,jpeg,MP3,MP4,doc)",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: width * 0.04,),
                SizedBox(height: width * 0.04,),
               ElevatedButton(onPressed: (){}, child: Text("SUBMIT")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}