import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iginfo/models/languages.dart';

part 'languages_state.dart';

class LanguagesCubit extends Cubit<Languages> {
  LanguagesCubit() : super(Languages(from: 'it', to: 'en'));

  void changeLanguages({required String from, required String to}) {
    emit(Languages(from: from, to: to));
  }
}
