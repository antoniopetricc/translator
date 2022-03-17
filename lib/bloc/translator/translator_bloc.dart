import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iginfo/repository/api.dart';

part 'translator_event.dart';
part 'translator_state.dart';

class TranslatorBloc extends Bloc<TranslatorSearchEvent, TranslatorState> {
  TranslatorBloc({required this.api}) : super(TranslatorInitial()) {
    on<TranslatorSearchEvent>(_onTranslatorSearchEvent);
  }

  final Api api;

  Future _onTranslatorSearchEvent(
    TranslatorSearchEvent event,
    Emitter<TranslatorState> emit,
  ) async {
    emit(TranslatorLoadingState());
    try {
      final translator = await api.translate(
        text: event.text,
        from: event.from,
        to: event.to,
      );

      emit(TranslatorFetchedState(translator.translatedText));
    } catch (e) {
      print(e);
      emit(TranslatorErrorState());
    }
  }
}
