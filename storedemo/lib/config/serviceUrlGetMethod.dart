import "package:dio/dio.dart";
import '../config/serviceUrl.dart';

class GetHomePageData {
  List data;
  GetHomePageData();
  getHomePageContent() async {
    try {
      print('开始获取首页数据...............');
      Response response;
      Dio dio = new Dio();
      dio.options.contentType = 'application/json';
      print(servicePath['homePageContext1']);
      response = await dio.get(servicePath['homePageContext1']);

      print("获得的数据");
      print(response.data);
      print("数据类型");
      print(response.data.runtimeType.toString());

      if (response.statusCode == 200) {
        this.data = response.data;
      } else {
        throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    } catch (e) {
      return print('ERROR:======>$e');
    }
  }
}
// // pub.dev
// Future getHomePageContent() async {
//   try {
//     print('开始获取首页数据...............');
//     Response response;
//     Dio dio = new Dio();
//     //
//     dio.options.contentType = 'application/jso';
//     // dio.options.contentType = ContentType.parse('application/json;charset=utf-8',,json);

//     // var formData = {'lon': '115.02932', 'lat': '35.76189'};
//     // FormData formData = new FormData.fromMap({
//     //   "name": "wendux",
//     //   "age": 25,
//     // });
//     print(servicePath['homePageContext']);
//     response = await dio.post(servicePath['homePageContext']);

//     if (response.statusCode == 200) {
//       List list = response.data['data'];
//       print(list.length);
//       // print(response.data['data'][0]['children']);
//       // print(response.data['page']['list'][0]['name']);
//       // return response.data;
//       return list;
//     } else {
//       throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
//     }
//   } catch (e) {
//     return print('ERROR:======>$e');
//   }
// }
