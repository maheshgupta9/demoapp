// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:itlwebapp/module/orderdetails/views/tabbar.dart';
import 'package:sidebarx/sidebarx.dart';
import '../widgets/appbardesigned.dart';
import '../widgets/dashboradscreen.dart';
import '../widgets/sidebarwidget.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();
// var scaffoldKey = GlobalKey<ScaffoldState>();


var height = Get.height - 50;
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

// const primaryColor = Color(0xFF6252DA);
// const canvasColor = Color(0xFF2E2E48);
// const scaffoldBackgroundColor = Color(0xFF7777B6);

class _DashboardState extends State<Dashboard> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);

    return SafeArea(
      child: Builder(builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
            endDrawer: 
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Row(
                      children: [
                        Expanded(child:Padding(
                          padding: const EdgeInsets.only(left:40),
                          child: Text('More Filters',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        )),
                        Padding(
                         padding: const EdgeInsets.only(right:20),
                          child: IconButton(icon: Icon(Icons.close_rounded),onPressed: () {
                           Navigator.pop(context);
                          },),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),

                


                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  // width: MediaQuery.of(context).size.width * 0.5,
                                  
                                  color: Colors.white,
                                  // elevation: 0,
                              
                                  child: Text('end drawer'),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  // width: MediaQuery.of(context).size.width * 0.5,
                                  
                                  color: Colors.red,
                                  // elevation: 0,
                              
                                  child: Text('end drawer'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),



                   Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Row(
                      children: [
                        Expanded(child: Text('data')),
                        Text('data')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            key: scaffoldKey,
            drawer: SideBar(
              controller: _controller,
            ),
            body: Row(
              children: [
                if (!isSmallScreen) SideBar(controller: _controller),
                Expanded(
                    child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      switch (_controller.selectedIndex) {
                        case 0:
                          scaffoldKey.currentState?.openEndDrawer();
                          return SingleChildScrollView(
                            child: Container(
                              child: BootstrapContainer(
                                  fluid: true,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[200]),
                                  children: [tablelistPage()]),
                            ),
                          );

                        // screen1();
                        case 1:
                          scaffoldKey.currentState?.closeDrawer();
                          return Container();
                        case 2:
                          scaffoldKey.currentState?.closeDrawer();
                          return Center(
                            child: Text(
                              'Settings',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
                        case 3:
                          scaffoldKey.currentState?.closeDrawer();
                          return Center(
                            child: Text(
                              'Theme',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 40),
                            ),
                          );
                        default:
                          return Center(
                            child: Text(
                              'Home',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 40),
                            ),
                          );
                      }
                    },
                  ),
                ))
              ],
            ));
      }),
    );
  }
}




Widget dividerLine() =>
    Divider(height: 1, thickness: 1, color: Color(0xFFebecf0));


String textSelected = "";
Color bgContainer = Color(0xFFf1f5f6);


Widget displayTrailing({String? text, dynamic tralingvalue}) {
    return InkWell(
        onTap: () {
        //   setState(() {
        //     if (textSelected == 'Lead') {
        //       if (trailingSelected.isNotEmpty &&
        //           trailingSelected.any((element) => element == text)) {
        //         Tralingvalue.removeWhere((element) => element == tralingvalue);
        //       } else {
        //         Tralingvalue.add(tralingvalue.toString());
        //       }
        //     }

        //     //  Tralingvalue.add(tralingvalue);
        //     print(Tralingvalue);
        //     print(text);

        //     print('22222222222222222222222222222222');

        //     if (text.toString() == "Custom") {
        //       // date_alert();
        //       showDialog<String>(
        //         context: context,
        //         builder: (BuildContext context) => AlertDialog(
        //           title: const Text(Variable.CustomDate,
        //               style:
        //                   TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
        //           content: SingleChildScrollView(
        //             child: Column(
        //               children: [
        //                 Text(
        //                   Variable.StartDate,
        //                   style: TextStyle(
        //                       fontSize: 20, fontWeight: FontWeight.w400),
        //                 ),
        //                 Container(
        //                     height: 200,
        //                     width: 300,
        //                     child: buildDatePickernrd("start")),
        //                 Text(
        //                   Variable.EndDate,
        //                   style: TextStyle(
        //                       fontSize: 20, fontWeight: FontWeight.w400),
        //                 ),
        //                 Container(
        //                     height: 200,
        //                     width: 300,
        //                     child: buildDatePickernrd("end")),
        //               ],
        //             ),
        //           ),
        //           actions: <Widget>[
        //             TextButton(
        //               onPressed: () {
        //                 Get.back();
        //                 setState(() {
        //                   // trailingSelected = [];
        //                 });
        //               },
        //               child: const Text(Variable.Cancel),
        //             ),
        //             TextButton(
        //               onPressed: () {
        //                 Get.back();
        //               },
        //               child: const Text(Variable.Apply),
        //             ),
        //           ],
        //         ),
        //       );
        //     }
        //   });
        //   if (FilterFunction.checkIfValueExist(trailingSelected, text)) {
        //     trailingSelected.removeWhere((element) => element == text);
        //   } else {
        //     trailingSelected.add(text);
        //   }
        //   setState(() {});
        },
        child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              // ImageIThinkLogistic(
              //     image: trailingSelected.isNotEmpty &&
              //             trailingSelected.any((element) => element == text)
              //         ? AppIconImage.checkBoxWareHouseBlue
              //         : AppIconImage.checkBoxWareHouseOutlineGrey,
              //     height: 20,
              //     width: 20),
              // SizedBox(width: 20),
              Expanded(
                child: Text(text!,
                    // style: normalRubikSize(
                    //     color: Color(0xff172B4D), fontSize: 14)
                        ),
              )
            ])));
  }

  Widget displayHeadingBox({String? text}) {
    return InkWell(
        onTap: () {
          // textSelected = text;
          // if (heading_array.contains("Lead")) {
          // } else {
          //   heading_array.add(textSelected);
          // }

          // // trailingSelected = [];
          // print(textSelected.toString());
          // setState(() {
          //   filter_status = [];
          // });
        },
        child: Container(
            // height: 55,
            width: 128,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: text == textSelected ? Colors.white : bgContainer,
                border: text == textSelected
                    ? null
                    : Border(
                        bottom:
                            BorderSide(color: Color(0xffEBECF0), width: 1.0))),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Text(text!,
                // style: text == textSelected
                //     ? fontRubikSize(
                //         color: Color(0xff253858),
                //         fontSize: 15,
                //         fontWeight: FontWeight.w500)
                //     : normalRubikSize(
                //         color: Color(0xff42526E), fontSize: 15)
                        
                        )));
  }

  


class FilterModel {
  String? heading;
  String? title;
  String? value;

  FilterModel({this.heading, this.value, this.title});
}

class FilterFunction {
  FilterFunction._();

  static getExistingValue(List<String> list, List<FilterModel> getList,
      List<FilterModel> filterList, String type,
      {int? subString}) {
    // List<FilterModel> getList=<FilterModel>[];
    if (list.isNotEmpty) {
      List<FilterModel> valuesData =
          filterList.where((element) => element.heading == type).toList();
      if (valuesData != null && valuesData.isNotEmpty) {
        valuesData.forEach((e) {
          if (checkIfValueExist(list, e.value!.substring(subString!))) {
            getList.add(e);
          }
        });
      }
    }
  }

  static String getStringValue(List<String> list) {
    return list.length != null
        ? list.length == 1
            ? list[0]
            : list.join(",")
        : "";
  }

  static List<FilterModel> getSelectedFilter({String? heading, dynamic list}) {
    if (list.any((element) => element.heading == heading)) {
      return list.where((element) => element.heading == heading).toList();
    } else {
      return [];
    }
  }

  static bool checkIfValueExist(List<String> list, String value) =>
      list.isNotEmpty && list.any((element) => element == value);
}