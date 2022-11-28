import 'package:flutter/material.dart';
import 'module/dashboard/views/maindashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home:  Dashboard(),
    );
  }
}




// class TodoPage extends StatefulWidget {
//   TodoPage({Key? key}) : super(key: key);

//   @override
//   _TodoPageState createState() => _TodoPageState();
// }

// class _TodoPageState extends State<TodoPage> {
//    String? selectedValue; // **FOR DEFAULT VALUE**
//   late String selectedValue2;
//   List<String> dropDownItemValue = ['123', '2', '4', 'Create'];
//   List<String> dropDownItemValue2 = ['xx', '2', '4'];

//   late final dropDownKey2;

//   final FocusNode dropDownFocus = FocusNode();

//   @override
//   void initState() {
//     super.initState();

//     ///selected value must be contain at dropDownItemValue
//     // selectedValue = dropDownItemValue[0];
//     selectedValue2 = dropDownItemValue2[0];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: Colors.deepPurple,
//       body: Center(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // MyTabBar(),

//             DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//               hint: Text('select'),
//                 value: selectedValue, // CANT SET THE DEFAULT VALUE**
//                 isExpanded: true,
//                 // icon: Image.asset('assets/down-list-arrow.png'),
//                 iconSize: 10,
//                 elevation: 16,
//                 onChanged: (newValue) {
//                   print(newValue);
//                   setState(() {
//                     selectedValue = newValue!; //   SET THE DEFAULT VALUE**
//                   });
//                 },

//                 /// dont assing same value on multiple widget
//                 items: List.generate(
//                   dropDownItemValue.length,
//                   (index) => DropdownMenuItem(
//                       child: Text('${dropDownItemValue[index]}'),
//                       value: '${dropDownItemValue[index]}'),
//                 ),
//               ),
//             ),

//             SizedBox(
//               height: 100,
//             ),
//             DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 focusNode: dropDownFocus,
//                 value: selectedValue2, // CANT SET THE DEFAULT VALUE**
//                 isExpanded: true,
//                 // icon: Image.asset('assets/down-list-arrow.png'),
//                 iconSize: 10,
//                 elevation: 16,
//                 onChanged: (newValue) {
//                   print(newValue == null);
//                   // if value doesnt contain just close the dropDown
//                   if (newValue == null) {
//                     dropDownFocus.unfocus();
//                   } else
//                     setState(() {
//                       selectedValue2 = newValue; //   SET THE DEFAULT VALUE**
//                     });
//                 },

//                 /// dont assing same value on multiple widget
//                 items:
//                  List.generate(
//                   dropDownItemValue2.length + 1,
//                   (index) => index < dropDownItemValue2.length
//                       ? DropdownMenuItem(
//                           child: Text('${dropDownItemValue2[index]}'),
//                           value: '${dropDownItemValue2[index]}')
//                       : DropdownMenuItem(
//                           child: ElevatedButton(

//                             child: Text('Create'),
//                             onPressed: () {},
//                           ),
//                         ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }




// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:popover/popover.dart';
// import 'package:collection/collection.dart';

// void main() => runApp(PopoverExample());

// var data = 'select';
// List<String> selectedItems = [];

// class PopoverExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Popover Example')),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.max,
//                   children: [

//                     CustomDropDownButton(
//                       items: ['one', 'two', 'three', '44', '555', '666'],
//                       buttonHeight: 35,
//                       buttonWidth: 180,
//                       hint: 'hello',
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                         boxShadow: [
//                           BoxShadow(color: Colors.black26, blurRadius: 5)
//                         ],
//                       ),
//                       dropdownheader: ElevatedButton(
//                           onPressed: () {}, child: Text('submit')),
//                       dropDownfooter: ElevatedButton(
//                           onPressed: () {}, child: Text('submit')),
//                       dropdownMaxHeight: 200,
//                       dropdownMaxWidth: 200,
//                       showdivider: true,
//                       dividercolor: Colors.grey,
//                       selectmultiplevalues: true,
//                       showicon: true,
//                     ),

//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ///
// ///


// ///

// class ListItems extends StatefulWidget {
//   const ListItems({Key? key}) : super(key: key);

//   @override
//   State<ListItems> createState() => _ListItemsState();
// }

// class _ListItemsState extends State<ListItems> {
//   @override
//   Widget build(BuildContext context) {
//     return
//         // Scrollbar(
//         //   child:
//         Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Column(
//         children: [
//           ElevatedButton(onPressed: () {}, child: Text('submit')),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                   // padding: const EdgeInsets.all(8),
//                   children: list
//                       .mapIndexed((index, element) => InkWell(
//                             onTap: () {
//                               setState(() {
//                                 print(index);

//                                 data = element.data!;
//                                 print(data);
//                               });

//                               // Navigator.of(context)
//                               //   ..pop()
//                               //   ..push(
//                               //     MaterialPageRoute<SecondRoute>(
//                               //       builder: (context) => SecondRoute(),
//                               //     ),
//                               //   );
//                               navigator!.pop(context);
//                             },
//                             child: Container(
//                                 height: 50,
//                                 color: Colors.amber[100],
//                                 child: Text(element.data.toString())),
//                           ))
//                       .toList()

//                   // const Divider(),
//                   // Container(
//                   //   height: 50,
//                   //   color: Colors.amber[200],
//                   //   child: const Center(child: Text('Entry B')),
//                   // ),
//                   // const Divider(),
//                   // Container(
//                   //   height: 50,
//                   //   color: Colors.amber[300],
//                   //   child: const Center(child: Text('Entry C')),
//                   // ),
//                   // const Divider(),
//                   // Container(
//                   //   height: 50,
//                   //   color: Colors.amber[400],
//                   //   child: const Center(child: Text('Entry D')),
//                   // ),
//                   // const Divider(),
//                   // Container(
//                   //   height: 50,
//                   //   color: Colors.amber[500],
//                   //   child: const Center(child: Text('Entry E')),
//                   // ),
//                   // const Divider(),
//                   // Container(
//                   //   height: 50,
//                   //   color: Colors.amber[600],
//                   //   child: const Center(child: Text('Entry F')),
//                   // ),

//                   ),
//             ),
//           ),
//           ElevatedButton(onPressed: () {}, child: Text('submit')),
//         ],
//       ),
//       // ),
//     );
//   }
// }

// class listtext {
//   final String? data;

//   listtext({this.data});
// }

// List<listtext> list = [
//   listtext(data: 'data1'),
//   listtext(data: 'data2'),
//   listtext(data: 'data3'),
//   listtext(data: 'data4'),
//   listtext(data: 'data5'),
//   listtext(data: 'data6'),
//   listtext(data: 'data7'),
//   listtext(data: 'data1'),
//   listtext(data: 'data2'),
//   listtext(data: 'data3'),
//   listtext(data: 'data4'),
//   listtext(data: 'data5'),
//   listtext(data: 'data6'),
//   listtext(data: 'data7'),
// ];

// class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second Route'),
//         automaticallyImplyLeading: false,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text('Back'),
//         ),
//       ),
//     );
//   }
// }
