import 'dart:io';

main(List<String> args) {
  print("----- start ------");

  //getData();

  getNetData().then((value) {
    print(value);
  });

  //链式调用
  getNetData().then((value1) {
    print(value1);
    return "----- second data ------";
  }).then((value2) {
    print(value2);
    return "----- third data ------";
  }).then((value3) {
    print(value3);
  });


  Future.value("----- hello future").then((value){
    print(value);
  });

  getErrorData().then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  });


  getNetWorkData().then((value){
    print(value);
  });

  print("----- end   ------");
}

//耗时操作，等待3秒
String getData() {
  sleep(Duration(seconds: 3));
  return "----- 返回数据 ----";
}

//异步操作
Future<String> getNetData() {
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    return "----- 异步返回数据 ----";
  });
}

//抛出异常
Future<String> getErrorData() {
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    throw Exception("网络请求出现错误");
  });
}

//使用 await+async 实现异步，返回的是Future类型
Future<String> getNetWorkData() async {
  var result = await Future.delayed(Duration(seconds: 3), () {
    return "network data";
  });

  return "----- " + result;
}