// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:itlwebapp/module/dashboard/widgets/appbardesigned.dart';

import '../../orderdetails/views/tabbar.dart';

dynamic sizesss;
dynamic width;

class tablelistPage extends StatefulWidget {
  @override
  State<tablelistPage> createState() => _tablelistPageState();
}

class _tablelistPageState extends State<tablelistPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  TabController? _tabController;

  List tabs = [
    'Store Order',
    'Ready to Dispatch',
    'Mainfest',
    'Intrasit',
    'Delivered',
    'Undelivered',
    'All'
  ];

  // void initState() {
  //   super.initState();
  //   _tabController  =  TabController(
  //       vsync: this,
  //       length: 7,
  //       initialIndex: 7);
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BootstrapCol(sizes: 'col-lg-12', child: appbardesign()),
        SizedBox(height: 30),
        BootstrapContainer(fluid: true, children: [
          BootstrapCol(
              sizes: 'col-lg-2',
              child: BootstrapContainer(
                  padding: EdgeInsets.only(left: 18),
                  children: [
                    Icon(
                      Icons.add_box_rounded,
                      size: 35,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 0, left: 8),
                        child: Text(
                          "Order",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ))
                  ])),
          BootstrapCol(
            offsets: 'offset-lg-4',
            sizes: 'col-lg-2',
            child: BootstrapContainer(
                padding: EdgeInsets.only(left: 90, top: 4),
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_right_outlined,
                    size: 24,
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 0, left: 8),
                      child: Text(
                        "Export",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ))
                ]),
          ),
          BootstrapCol(
              sizes: 'col-lg-2',
              child: Container(
                  padding: EdgeInsets.only(top: 4),
                  alignment: Alignment.center,
                  child: Text(
                    'International',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ))),
          BootstrapCol(
              sizes: 'col-lg-2',
              child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 2),
                  child: ElevatedButton(
                      onPressed: (() {}),
                      child: Text(
                        "Create Order",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue.shade900),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )))))),
        ]),

        Padding(
          padding: const EdgeInsets.only(top: 28, right: 20, left: 20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: DefaultTabController(
              initialIndex: 6,
              length: 7,
              child: 
            
                  BootstrapContainer(
                    padding: EdgeInsets.only(top: 20),
                    fluid: true,
                    children: [
                    Padding(
                      padding: const EdgeInsets.only(top:5),
                      child: BootstrapCol(
                        sizes: 'col-lg-10 col-md-10 col-sm10',
                        child: Container(
                          padding: EdgeInsets.only( left:10,right: 10),
                          child: TabBar(
                              controller: _tabController,
                              isScrollable: true,
                              tabs: tabs
                                  .map((e) => Text(e.toString(),
                                      style: TextStyle(color: Colors.black)))
                                  .toList()),
                        ),
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-lg-2 col-md-2 col-sm-2',
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 25),
                                // color: Colors.amber,
                                child: Icon(Icons.check_box_outlined))
                          ]),
                      // ),
                    ),
                      Container(
                    height: MediaQuery.of(context).size.height * 1,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Datatables(),
                      ],
                    ),
                  ),
                  ]),
                
               
            ),
          ),
        ),
      ],
    );
  }
}
