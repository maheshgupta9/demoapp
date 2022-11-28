// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import '../views/maindashboard.dart';

class appbardesign extends StatefulWidget {
  appbardesign({super.key});

  @override
  State<appbardesign> createState() => _appbardesignState();
}

class _appbardesignState extends State<appbardesign> {
  @override
  Widget build(BuildContext context) {
    return BootstrapContainer(
        decoration: BoxDecoration(color: Colors.white),
        fluid: true,
        children: [
          BootstrapCol(
            sizes: 'col-lg-2 col-xl-2 col-md-4 cod-sm-12 col-xs-12',
            child: BootstrapRow(
              children: [
                BootstrapCol(
                  invisibleForSizes: 'lg xl md',
                  sizes: 'col-sm-1 col-md-1 ',
                  child: InkWell(
                    onTap: () {
                      setState(() {
                      scaffoldKey.currentState?.openDrawer();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 0, top: 14),
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.menu),
                    ),
                  ),
                ),
                BootstrapCol(
                  sizes: 'col-md-11 col-sm-11 ',
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 15,bottom: 15),
                    child: Text(
                      "IThink Logistics",
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BootstrapCol(
                        invisibleForSizes: 'md sm xs',

              offsets: 'offset-lg-4',
              sizes: 'col-lg-2',
              child: IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.only(top: 8, left: 20, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: 29,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Early COD"),
                      SizedBox(
                        width: 9,
                      ),
                      VerticalDivider(
                        indent: 5,
                        endIndent: 5,
                        thickness: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              )),
          BootstrapCol(
            invisibleForSizes: 'md sm xs',
              sizes: 'col-lg-2',
              child: IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text( "₹ 000000000",style: TextStyle(fontSize: 15,color:  Colors.black),),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(
                        Icons.pages_outlined,
                        size: 22,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      VerticalDivider(
                        indent: 1,
                        endIndent: 1,
                        thickness: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              )),
          BootstrapCol(
          invisibleForSizes: 'md sm xs',
          sizes: 'col-xl-2 col-lg-2 ',
          child: Container(
            child: BootstrapRow(
              children: [
                BootstrapCol(
                  sizes: 'col-lg-4',
                  child: Container(
                    padding: const EdgeInsets.only(top: 12),
                    child: Icon(
                      Icons.home,
                      size: 20,
                    ),
                  ),
                ),
                BootstrapCol(
                  sizes: 'col-lg-4',
                  child: Container(
                    padding: const EdgeInsets.only(top: 12),
                    child: Icon(
                      Icons.backup_table_outlined,
                      size: 20,
                    ),
                  ),
                ),
                BootstrapCol(
                  sizes: 'col-lg-4',
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 12),
                    child: Icon(
                      Icons.mail_rounded,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          )),
        ]);
  }
}
