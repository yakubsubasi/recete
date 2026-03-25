import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:provider/provider.dart';
import 'package:recete/color_schemes.g.dart';
import 'package:recete/pages/home_page/home_page.dart';
import 'package:recete/pages/list_page/landing_page_controller.dart';
import 'package:recete/pages/onboarding/onboarding_page.dart';
import 'package:recete/prefrences/cubit/prefrences_cubit.dart';
import 'package:recete/prefrences/model/prefences.dart';
import 'package:recete/prefrences/service/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ListPageController(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_AppData>(
      future: _loadAppData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          return BlocProvider<PrefrencesCubit>(
            create: (context) => data.cubit,
            child: BlocBuilder<PrefrencesCubit, Prefrences>(
              builder: (context, prefrences) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    useMaterial3: true,
                    colorScheme: lightColorScheme,
                    appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                      elevation: 0,
                      centerTitle: true,
                      color: Colors.transparent,
                      titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  darkTheme: ThemeData(
                      useMaterial3: true, colorScheme: darkColorScheme),
                  home: data.onboardingCompleted
                      ? const HomePage()
                      : const OnboardingPage(),
                  themeMode: prefrences.themeMode,
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<_AppData> _loadAppData() async {
    final pref = await SharedPreferences.getInstance();
    final service = MyPrefrencesService(pref);
    final cubit = PrefrencesCubit(service, service.getPrefences());
    final onboardingDone = await isOnboardingCompleted();
    return _AppData(cubit: cubit, onboardingCompleted: onboardingDone);
  }
}

class _AppData {
  final PrefrencesCubit cubit;
  final bool onboardingCompleted;

  _AppData({required this.cubit, required this.onboardingCompleted});
}
