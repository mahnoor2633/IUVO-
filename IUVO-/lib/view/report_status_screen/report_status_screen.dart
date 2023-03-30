import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/view/create_report_sceen/create_report_screen.dart';

class ReportStatusScreen extends StatefulWidget {
  const ReportStatusScreen({Key? key}) : super(key: key);

  @override
  State<ReportStatusScreen> createState() => _ReportStatusScreenState();
}

class _ReportStatusScreenState extends State<ReportStatusScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Get.to(const CreateNewReportScreen()),
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: width * 0.04),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.04, horizontal: width * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(-2, 2),
                        blurRadius: 7,
                        spreadRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      list[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.05,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: width * 0.01, horizontal: width * 0.03),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: appThemeColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            list[index].category,
                            style: const TextStyle(color: appThemeColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    Text(
                      list[index].description,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    Text(
                      list[index].status,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: index == 0 ? Colors.blueAccent : Colors.green,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: width * 0.04,
              );
            },
            itemCount: list.length),
      ),
    );
  }

  List<ReportStatusModel> list = [
    ReportStatusModel(
        title: "Killing Attack by Police",
        category: "Abuse",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        status: "Pending"),
    ReportStatusModel(
        title: "Drugs Smuggling",
        category: "Drugs",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        status: "Approve"),
    ReportStatusModel(
        title: "Bank Robbery",
        category: "Robbery",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        status: "Approve"),
  ];
}

class ReportStatusModel {
  String title;
  String description;
  String category;
  String status;
  ReportStatusModel(
      {required this.title,
      required this.category,
      required this.description,
      required this.status});
}
