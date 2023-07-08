import 'package:flutter/material.dart';
import 'package:chekinapp/routes/intro/intro_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'export.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppProvider()),
    ChangeNotifierProvider(create: (_) => MainProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    Provider<BuildContext>(create: (c) => c),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeType = context.select<AppProvider, ThemeType>((val) => val.theme);
    AppTheme theme = AppTheme.fromType(themeType);
    Locale preferredLanguage =
        context.select((AppProvider provider) => provider.preferredLanguage);
    return Provider.value(
      value: theme,
      child: MaterialApp(
        navigatorKey: R.N.navKey,
        debugShowCheckedModeBanner: false,
        title: 'Cheki App',
        theme: theme.themeData,
        home: const IntroScreen(),
        builder: (context, child) => MediaQuery(
          data: context.widthPx < 600
              ? context.mq.copyWith(textScaleFactor: .8)
              : context.mq.copyWith(textScaleFactor: 1),
          child: child!,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('es'), // Spanish
        ],
        locale: preferredLanguage,
      ),
    );
  }
}
