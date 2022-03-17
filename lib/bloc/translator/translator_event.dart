part of 'translator_bloc.dart';

abstract class TranslatorEvent extends Equatable {
  const TranslatorEvent();

  @override
  List<Object> get props => [];
}

class TranslatorSearchEvent extends TranslatorEvent {
  final String from;
  final String to;
  final String text;

  const TranslatorSearchEvent(this.text, this.from, this.to);
  @override
  List<Object> get props => [text];
}
