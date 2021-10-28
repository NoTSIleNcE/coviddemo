import 'package:retrofit/http.dart';
import 'package:covidapp/api/api_client.dart';
import 'package:covidapp/api/models/statistics_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api.g.dart';

//this is like the Java new but is just that, do not need to call it every single time when run the project
//this is like a global variable 
//the whole code is like a global variable 

@RestApi() //use to get back the data in JSON format easily. SO in this case, it will take the API from the URL and convert it into JSON format
abstract class Api {
  factory Api() {
    return _instance;
  }

  static final dio = ApiClient().dio;
  static final _instance =
      _Api(dio, baseUrl: "https://covid-193.p.rapidapi.com");

  @GET("/statistics")
  Future<StatisticResponse> getStatistics(@Query('country') String country); 
  //this future is so that, in the end it will return something. Definitely, going to return something 
}