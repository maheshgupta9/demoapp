// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../../core/utilities/variable.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key, required SidebarXController controller})
      : _controller = controller,
        super(key: key);
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      collapseIcon: Icons.close,
      extendIcon: Icons.menu,
      controller: _controller,
      theme: const SidebarXTheme(
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
          size: 20,
        ),
        itemTextPadding: EdgeInsets.only(left: 20),
        selectedItemTextPadding: EdgeInsets.only(left: 20),
        hoverColor: Colors.grey,
        textStyle: TextStyle(color: Colors.black),
        selectedTextStyle: TextStyle(color: Colors.blue),
        decoration: BoxDecoration(
            color: Colors.white,
            ),
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
      ),
      extendedTheme: const SidebarXTheme(width: 250),
      footerDivider: Divider(color: Colors.white.withOpacity(0.8), height: 1),
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: Variable.Home,
         
        ),
        SidebarXItem(
          icon: Icons.online_prediction_rounded,
          label: Variable.Order,
        ),
        SidebarXItem(
          icon: Icons.request_page_sharp,
          label: Variable.Billing,
        ),
        SidebarXItem(
          icon: Icons.favorite,
          label: Variable.Postshipping,
        ),
        SidebarXItem(
          icon: Icons.ac_unit_outlined,
          label: Variable.Insights,
        ),
        SidebarXItem(
          icon: Icons.integration_instructions_outlined,
          label: Variable.Integration,
        ),
        SidebarXItem(
          icon: Icons.flip_to_back_outlined,
          label: Variable.Tool,
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: Variable.Setting,
        ),
        SidebarXItem(
          icon: Icons.account_circle_outlined,
          label: Variable.Account,
        ),
        SidebarXItem(
          icon: Icons.other_houses_outlined,
          label: Variable.others,
        ),
      ],
    );
  }
}

