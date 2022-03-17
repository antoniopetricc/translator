part of 'translator_bloc.dart';

abstract class TranslatorState extends Equatable {
  const TranslatorState();

  @override
  List<Object> get props => [];
}

class TranslatorInitial extends TranslatorState {}

class TranslatorLoadingState extends TranslatorState {}

class TranslatorErrorState extends TranslatorState {}

class TranslatorFetchedState extends TranslatorState {
  final String translatedText;

  const TranslatorFetchedState(this.translatedText);
  @override
  List<Object> get props => [translatedText];
}
