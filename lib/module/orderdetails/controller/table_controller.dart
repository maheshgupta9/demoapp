import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:itlwebapp/core/api/api_request.dart';
import 'package:itlwebapp/core/api/config/config.dart';
import 'package:itlwebapp/module/orderdetails/views/tabbar.dart';
// import 'package:itlwebapp/module/orderdetails/widgets/bsdatatablewidgets.dart';


class Tablecontrolle extends GetxController {
  var isLoading = false.obs;
  GetStorage storage = GetStorage();
  var statusCode = 0.obs;
  // var sourcetable = source.response.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  Future tableData(Map<String, dynamic>? params) async {
    print('table data ');
    // Map<String, dynamic>? params;

    try {
      isLoading(true);
      // var data = params;
      // {};
      print('object 1');
      // source.controller.reload();
      await ApiRequest.sendRequest(
              bodyData: params,
              requestUrlData: Config.BASE_URl,
              isPostRequest: true,
              statusCode: statusCode,
              isFetching: isLoading)
          .then((response)  {
            print(response);
            print('object 2');
        if (response != null) {
          // print(response);
          var jsonresponse =  Map<String, dynamic>.from(response.data);
          print(jsonresponse);
          print('json response');
          if (response.statusCode == 200 && jsonresponse['status'] == 'success') {
            print('object 3');
            source.response =
                BsDatatableResponse.createFromJson(jsonresponse['data']);
            // print(sourcetable);
            source.controller.reload();
            // });
            isLoading(false);
          } else {
            print('object 4');
            // source.controller.reload();
            print('error');
          }
        }
      });
    } catch (e) {
       print(e);
      print('object 5');
      isLoading(false);
     
    }
    return params;
  }
}
