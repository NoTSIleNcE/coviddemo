import 'package:dio/dio.dart';

class ApiClient{
  static ApiClient _instance=ApiClient._();
  factory ApiClient()=>_instance;

  final Dio dio=Dio(BaseOptions(headers:{
    'Content-Type':'application/json',
    'X-RapidAPI-Key':'87c232f9cdmshe09b4a34757148ap14edbcjsn46ff6f273bde'
  }));

  //this whole thing is to check for whether the api is correctly sent or not 
  ApiClient._(){
    dio.interceptors.add(InterceptorsWrapper(onRequest:(RequestOptions options,_)async{
      print(
        //see the get method is correct or not 
        'Call: ${options.method} ${options.baseUrl}${options.path} ${options.queryParameters}'
      );
      print('Data: ${options.data}');

      _.next(options);
    },onResponse:(Response response,_)async{
      /*aysnc is a method that return to the caller immediately before completion of processing and with no blocks*/
      //when return, it is to return the data is what 
      print('Result: ${response.data}');
      _.next(response);
    },onError:(DioError e,_)async{
      //print the error and see what is the error 
      print('Error: ${e.response?.data??e.error}');
      _.next(e);
    }));
  }

}