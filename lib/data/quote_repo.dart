

import 'package:ayah/data/quote.dart';
import 'package:ayah/data/qute_web_service.dart';

class HomeRepository {
  final QuoteWebService quoteWebService;

  HomeRepository( this.quoteWebService,);



   Future<Quote> getQuote() async {
    final quote = await quoteWebService.getQuote();

    
    
    return   Quote.fromJson(quote);
  }

}
