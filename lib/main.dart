import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iginfo/bloc/translator/translator_bloc.dart';
import 'package:iginfo/cubits/languages/languages_cubit.dart';
import 'package:iginfo/pages/home/home.dart';
import 'package:iginfo/repository/api.dart';
import 'package:iginfo/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
