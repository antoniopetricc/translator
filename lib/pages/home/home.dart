import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/bloc/translator/translator_bloc.dart';
import 'package:translator/cubits/languages/languages_cubit.dart';
import 'package:translator/models/languages.dart';
import 'package:translator/styles.dart';
import 'package:translator/widgets/custom_button.dart';
import 'package:translator/widgets/custom_dropdown.dart';
import 'package:translator/widgets/ease_in.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _translationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesCubit, Languages>(
      builder: (context, languageState) {
        return BlocConsumer<TranslatorBloc, TranslatorState>(
          listener: (context, state) {
            _showError(context, state);
            if (state is TranslatorFetchedState) {
              _translationController.text = state.translatedText;
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: Styles.kPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Translator", style: Styles.kTitle),
                            const SizedBox(height: 40),
                            Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomDropDown(
                                      selectedValue: languageState.from,
                                      onChanged: (value) {
                                        context
                                            .read<LanguagesCubit>()
                                            .changeLanguages(
                                              from: value ?? 'it',
                                              to: languageState.to,
                                            );
                                      },
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        minLines: 1,
                                        maxLines: null,
                                        controller: _textController,
                                        style: Styles.kSubtitle,
                                        cursorColor: Styles.kPrimary,
                                        decoration:
                                            Styles.kTextFormDecoration.copyWith(
                                          hintText: "Enter your text",
                                          prefixIcon: const Icon(
                                            Icons.translate,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomDropDown(
                                      selectedValue: languageState.to,
                                      onChanged: (value) {
                                        context
                                            .read<LanguagesCubit>()
                                            .changeLanguages(
                                              from: languageState.from,
                                              to: value ?? 'it',
                                            );
                                      },
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: TextFormField(
                                        controller: _translationController,
                                        keyboardType: TextInputType.multiline,
                                        minLines: 1,
                                        maxLines: null,
                                        readOnly: true,
                                        style: Styles.kSubtitle,
                                        cursorColor: Styles.kPrimary,
                                        decoration:
                                            Styles.kTextFormDecoration.copyWith(
                                          hintText: "Translation",
                                          prefixIcon: const Icon(
                                            Icons.translate,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            CustomButton(
                              loading: state is TranslatorLoadingState,
                              text: "Translate",
                              onPressed: () {
                                context.read<TranslatorBloc>().add(
                                      TranslatorSearchEvent(
                                        _textController.text,
                                        languageState.from,
                                        languageState.to,
                                      ),
                                    );
                              },
                            ),
                            const SizedBox(height: 50),
                            EaseIn(
                              onTap: () async => await launch(
                                  'https://antoniopetricciuoli.com'),
                              child: Text(
                                "antoniopetricciuoli.com",
                                style: Styles.kSubtitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showError(BuildContext context, TranslatorState state) {
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        if (state is TranslatorErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Styles.kScaffold,
              title: Text(
                "Oops! Something went wrong",
                style: Styles.kTitle,
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "The translation failed :(",
                    style: Styles.kSubtitle,
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    text: "Try Again",
                    onPressed: () => Navigator.pop(context),
                    loading: false,
                  ),
                ],
              ),
            ),
          );
        }
      });
    }
  }
}
