import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/bloc/translator/translator_bloc.dart';
import 'package:translator/cubits/languages/languages_cubit.dart';
import 'package:translator/pages/home/home.dart';
import 'package:translator/repository/api.dart';
import 'package:translator/styles.dart';

void main() {
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Api(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TranslatorBloc>(
            create: (context) => TranslatorBloc(
              api: context.read(),
            ),
          ),
          BlocProvider(
            create: (context) => LanguagesCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Translator App',
          theme: ThemeData(
            primaryColor: Styles.kPrimary,
            fontFamily: GoogleFonts.lato().fontFamily,
            scaffoldBackgroundColor: Styles.kScaffold,
          ),
          home: const HomeView(),
        ),
      ),
    );
  }
}
