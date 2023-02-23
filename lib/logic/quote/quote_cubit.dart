import 'package:ayah/data/quote_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:ayah/data/quote.dart';
import 'package:meta/meta.dart';


part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final HomeRepository homeRepository;

  Quote? quote;
  QuoteCubit(this.homeRepository) : super(QuoteInitial());



  Quote? getQuote() {

   /*  Quote q= Quote(quote: 'ddddddddddd', author: 'dddddd', category: 'category'); */
    homeRepository.getQuote().then((quote) {
      emit(QuoteLoaded(quote));
      this.quote = quote;
    });
    return quote;
  }





}
