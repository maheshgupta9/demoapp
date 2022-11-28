import 'dart:async';
import 'dart:convert';
import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:itlwebapp/module/dashboard/views/maindashboard.dart';
import 'package:itlwebapp/module/dashboard/widgets/dashboradscreen.dart';
import 'package:itlwebapp/module/orderdetails/controller/table_controller.dart';
import 'package:itlwebapp/module/orderdetails/widgets/bsdatatablewidgets.dart';
import 'package:itlwebapp/core/utilities/core.dart';
import 'package:http/http.dart' as http;

BsDatatablesClearData? clearData;

var source = Bsdatatablewidget(data: [
//   // {
//   //   'id': '1234',
//   //   'first_name': 'manjknhbjhbrjhbjhchfrb hrb hcb rhbt',
//   //   'last_name': 'rtf',
//   //   'user_name': 'tfgr',
//   //   'email': 'jrncfjbfcjbjtnjtkre@gmail',
//   //   'company_name': 'm,ngjntrnjjnjrtbbbbbbbbbbbbbbbbbbnjrtknjkc'
//   // },
//   // {
//   //   'id': '4',
//   //   'first_name': 'manjknhbjhbrjhbjhchfrb hrb hcb rhbt',
//   //   'last_name': 'rtf',
//   //   'user_name': 'tfgr',
//   //   'email': 'jrncfjbfcjbjtnjtkre@gmail',
//   //   'company_name': 'm,ngjntrnjjnjrtbbbbbbbbbbbbbbbbbbnjrtknjkc'
//   // },
//   // {
//   //   'id': '5',
//   //   'first_name': 'manjknhbjhbrjhbjhchfrb hrb hcb rhbt',
//   //   'last_name': 'rtf',
//   //   'user_name': 'tfgr',
//   //   'email': 'jrncfjbfcjbjtnjtkre@gmail',
//   //   'company_name': 'm,ngjntrnjjnjrtbbbbbbbbbbbbbbbbbbnjrtknjkc'
//   // }
]);

List<String> items1 = [
  'Mainefast',
  'Not Picked',
  'Picked Up',
  'Intrasit',
  'Reached At Destination',
  'Out of Delivery',
  'Undelivery',
  'Delivery'
];

List<String> items2 = [
  'no',
  'items',
  'awb',
  'test5',
  'test61',
  'data custom',
  'test222',
  'test00000'
];

TextEditingController inputSearch = TextEditingController();
TextEditingController _inputLength = TextEditingController();

class Datatables extends StatefulWidget {
  @override
  _DatatablesState createState() => _DatatablesState();
}

class _DatatablesState extends State<Datatables> {
  String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;
  Tablecontrolle controller = Tablecontrolle();
  List<String> items = [
    'All',
    'Today',
    'Yesterday',
    'Last 7 Days',
    'Last 30 Days',
    'This Month',
    'Last Month',
    'Custom Range'
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      source.controller = BsDatatableController();
      // load();
    });
  }

  // load() {
  //   // source.controller.start = 10;

  //   // setState(() {
  //   source.controller.length = 10;
  //   // _inputLength.text = '10';

  //   source.controller
  //       .reload(clearData: clearData == BsDatatablesClearData.always);
  //   // });
  //   setState(() {});
  // }

  // Future loadApi(Map<String, dynamic> params)  async {
  //   print('he;ooo00000');
  //   return http
  //       .post(
  //     Uri.parse('http://192.168.1.103:3000/html_page'),
  //     body: params,
  //   )
  //       .then((value) async {
  //     Map<String, dynamic> json = await jsonDecode(value.body);
  //     // setState(() {
  //       source.response = BsDatatableResponse.createFromJson(json['data']);

  //     // });

  //     //  source.controller.reload();
  //   // });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return
        //  Scaffold(
        // key: scaffoldKey,
        // drawer: Container(

        //   child: Text('data'),
        // ),
        // body:
        Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              BsCardContainer(
                child: BsDatatable(
                  headersearch: BootstrapContainer(
                    fluid: true,
                    children: [
                      BootstrapCol(
                        sizes: 'col-xl-2 col-lg-6 col-sm-12 col-md-6',
                        child: searchForm(),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      BootstrapCol(
                        sizes: 'col-xl-3 col-lg-6 col-sm-12 col-md-6',
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: CustomDropDownButton(
                            items: items,
                            buttonHeight: 35,
                            // buttonWidth: 30,
                            hint: 'Date : 12-11-2022-12-11-2022',
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.black45,
                              ),
                            ),
                            dropdownMaxHeight: 200,
                            dropdownMaxWidth: 150,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      BootstrapCol(
                          sizes: 'col-xl-3 col-lg-12 col-sm-12 col-md-12',
                          child: InkWell(
                              onTap: () {
                                // openTheDrawer();
                                scaffoldKey.currentState!.openEndDrawer();
                                // Scaffold.of(context).openEndDrawer();

                                print('object');
                              },
                              child: StatusMorefilter())),
                      SizedBox(
                        height: 50,
                      ),
                      BootstrapCol(
                          sizes: 'col-xl-4 col-lg-12 col-sm-12 col-md-12',
                          child: SavefilterSelectfilter()),
                      SizedBox(
                        height: 50,
                      ),
                      // ),
                    ],
                  ),
                  source: source,
                  clearData: BsDatatablesClearData.never,
                  // title: Text(
                  //   'Datatable',
                  //   textAlign: TextAlign.center,
                  // ),
                  columns: Bsdatatablewidget.columns,
                  language: BsDatatableLanguage(
                      nextPagination: 'Next',
                      previousPagination: 'Previous',
                      information:
                          'Show __START__ to __END__ of __FILTERED__ entries',
                      informationFiltered:
                          'filtered from __DATA__ total entries',
                      firstPagination: 'First Page',
                      lastPagination: 'Last Page',
                      hintTextSearch: 'Search data ...',
                      perPageLabel: null,
                      searchLabel: null),
                  serverSide: controller.tableData,
                  // serverSide: loadApi,
                ),
              ),
            ],
          ),

          ///////////
        ),
      ),
      // ),
    );
  }
}

class SavefilterSelectfilter extends StatelessWidget {
  const SavefilterSelectfilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BootstrapContainer(
      fluid: true,
      children: [
        BootstrapCol(sizes: 'col-xl-2 col-lg-2 col-sm-2', child: pageLength()),
        BootstrapCol(
          sizes: 'col-xl-5 col-lg-4 col-sm-5',
          child: Padding(
            padding: const EdgeInsets.only(left: 3, right: 5),
            child: Container(
              height: 35,
              // width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black45,
                ),
              ),
              child: Center(
                  child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Icon(
                      Icons.edit,
                      size: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text('Save Filter'),
                  ),
                ],
              )),
            ),
          ),
        ),
        BootstrapCol(
          sizes: 'col-xl-5 col-lg-6 col-sm-5',
          child: CustomDropDownButton(
            items: items2,
            buttonHeight: 35,
            // buttonWidth: 100,
            hint: 'Select Filter',
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black45,
              ),
            ),
            dropdownMaxHeight: 200,
            dropdownMaxWidth: 150,
            showicon: true,
          ),
        ),
      ],
    );
  }
}

// ignore: use_key_in_widget_constructors
class StatusMorefilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BootstrapContainer(
      // decoration: BoxDecoration(color: Colors.amber),
      fluid: true,
      children: [
        BootstrapCol(
          sizes: 'col-lg-7 col-sm-6',
          child: CustomDropDownButton(
            items: items1,
            buttonHeight: 35,
            buttonWidth: 150,
            hint: 'Status',
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black45,
              ),
            ),
            dropdownheader: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text('Status'),
                )),
                InkWell(
                  onTap: () {
                    print(selectedItems);
                    selectedItems.clear();
                    print(selectedItems);
                    print('object');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      'Clear',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            dropDownfooter: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: ElevatedButton(onPressed: () {}, child: Text('Apply')),
                ),
              ],
            ),
            dropdownMaxHeight: 200,
            dropdownMaxWidth: 250,
            showdivider: true,
            dividercolor: Colors.grey,
            selectmultiplevalues: true,
            showicon: true,
          ),
        ),
        BootstrapCol(
          sizes: 'col-lg-5 col-sm-6',
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Container(
              height: 36,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black45,
                ),
              ),
              child: Center(child: Text('More Filter')),
            ),
          ),
        ),
      ],
    );
  }
}

Timer? _timer;

Widget searchForm({double width = 250}) {
  return Container(
    width: width,
    height: 35,
    decoration: BoxDecoration(
        color: Color(0xffF3F4F6),
        // border: Border.all(color: ),
        borderRadius: BorderRadius.all(Radius.circular(16))),
    child: TextField(
      controller: inputSearch,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
        hintText: 'Search Order ID or AWB',
        hintStyle: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w100, color: Colors.grey),
        isDense: true,
      ),
      // isDense: true,

      onChanged: (value) => _doneTyping(value, (value) {
        source.controller.searchValue = value;
        source.controller.start = 0;
        source.controller
            .reload(clearData: clearData == BsDatatablesClearData.always);
      }),
    ),
  );
}

Widget pageLength() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 60.0,
        margin: EdgeInsets.only(right: 5.0),
        decoration: BoxDecoration(
            color: Color(0xffF3F4F6),
            // border: Border.all(color: widget.style.borderColor),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: TextFormField(
          controller: _inputLength,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
            hintText: '10',
            hintStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w100,
                color: Colors.grey),
            isDense: true,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          // onEditingComplete: (value) => ,
          // onSubmitted: ,
          onChanged: (value) => _doneTyping(value, (value) {
            if (value == '' || int.parse(value) <= 0) {
              source.controller.length = 10;
              _inputLength.text = '10';
              source.controller
                  .reload(clearData: clearData == BsDatatablesClearData.always);
            } else {
              int length = int.parse(value);

              source.controller.start = 0;
              source.controller.length = length;
              source.controller
                  .reload(clearData: clearData == BsDatatablesClearData.always);
            }
          }),
        ),
      )
    ],
  );
}

void _doneTyping(dynamic value, ValueChanged<dynamic> callback) {
  if (_timer != null) _timer!.cancel();

  _timer = Timer(Duration(milliseconds: 500), () => callback(value));
}
