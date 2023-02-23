import 'package:dio/dio.dart';
import 'dart:math';

class QuoteWebService {

  late Dio dio;

  QuoteWebService(){
     BaseOptions options = BaseOptions(
     // baseUrl: 'https://shop-app-6a71c-default-rtdb.firebaseio.com',
      baseUrl: 'https://api.alquran.cloud/v1/ayah',
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  Future getQuote() async {

    Random rnd = new Random();
    // Define min and max value
    int min = 1, max = 6237;
    //Getting range
    int verse = min + rnd.nextInt(max - min);


    
    try {
      Response response = await dio.get('/${verse}/ar.asad'/* , options: Options(headers: { 'X-Api-Key': 'ENZHSxUv18NaEvlBWmBa/w==WolX5rQUEOJEGV2x'}) */);



      return response.data['data'];
    } catch (e) {
      print(e.toString());
      return {} ;
    }
  }
}
