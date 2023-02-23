part of 'quote_cubit.dart';


@immutable
abstract class QuoteState {}

class QuoteInitial extends QuoteState {}


class QuoteLoaded extends QuoteState {
  final Quote quote;
  QuoteLoaded(this.quote);
}
