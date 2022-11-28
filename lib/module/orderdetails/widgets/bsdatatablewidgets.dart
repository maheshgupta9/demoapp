import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Bsdatatablewidget extends BsDatatableSource {
  Bsdatatablewidget({
    List<Map<String, dynamic>>? data = const [],
  }) : super(data: data);

  data_conntctivity(int id) {
    http.post(
      Uri.parse('http://192.168.1.103:3001/html_page'),
      body: {"user_id": id.toString()},
    ).then((value) {
      controller.reload();
    });
  }

  static List<BsDataColumn> get columns => <BsDataColumn>[
        BsDataColumn(
          label: Text('ID'),
          columnName: 'id',
          orderable: true,
          searchable: true,
          width: 100,
        ),
        BsDataColumn(
          label: Text('Customer Name'),
          columnName: 'customer_name',
          width: 100,
          searchable: true,
          orderable: true,
        ),
        BsDataColumn(
          label: Text('Customer Address'),
          columnName: 'customer_address',
          width: 200,
          searchable: true,
          orderable: true,
        ),
        BsDataColumn(
          label: Text('Customer No'),
          columnName: 'customer_mobile',
          width: 100,
          searchable: true,
          orderable: true,
        ),
        BsDataColumn(
          label: Text('Customer Email'),
          columnName: 'customer_email',
          width: 100,
          searchable: true,
          orderable: true,
        ),
        BsDataColumn(
          label: Text('AWB No'),
          columnName: 'airway_bill_no',
          width: 100,
          searchable: true,
          orderable: true,
        ),
         BsDataColumn(
          label: Text('Customer Country'),
          columnName: 'customer_country',
          width: 100,
          searchable: true,
          orderable: true,
        ),
         BsDataColumn(
          label: Text('Order Date time'),
          columnName: 'order_date_time',
          width: 100,
          searchable: true,
          orderable: true,
        ),

        BsDataColumn(
          label: Text('Action'),
          columnName: 'action',
          width: 100,
        ),
      ];

  @override
  BsDataRow getRow(int index) {
    return BsDataRow(index: index, cells: <BsDataCell>[
      // BsDataCell(
      //    index == index2?
      //   TextFormField(
      //     readOnly:index == index2? false:true,
      //     controller: edit_name,
      //     decoration: InputDecoration(
      //       hintText: '${response.data[index]['first_name']}',
      //       border: InputBorder.none
      //     ),
      //   ):   Text('${response.data[index]['first_name']}')
      //   ),
      BsDataCell(Text('${response.data[index]['id']}')),
      BsDataCell(Text('${response.data[index]['customer_name']}')),
      BsDataCell(Text('${response.data[index]['customer_address']}')),
      BsDataCell(Text('${response.data[index]['customer_mobile']}')),
      BsDataCell(Text('${response.data[index]['customer_email']}')),
      BsDataCell(Text('${response.data[index]['airway_bill_no']}')),
      BsDataCell(Text('${response.data[index]['customer_country']}')),
      BsDataCell(Text('${response.data[index]['order_date_time']}')),
      BsDataCell(
        InkWell(
            onTap: () {
              data_conntctivity(response.data[index]['id']);
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
            )),
      )
    ]);
  }
}
