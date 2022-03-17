import 'package:bloc/bloc.dart';
import 'package:translator/models/languages.dart';

class LanguagesCubit extends Cubit<Languages> {
  LanguagesCubit() : super(Languages(from: 'it', to: 'en'));

  void changeLanguages({required String from, required String to}) {
    emit(Languages(from: from, to: to));
  }
}
