import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:haelth_app/features/home/presintation/page/home_page.dart';
import 'core/data_base/db/moor_db.dart';
import 'core/util/generate_screen.dart';

final db = MyDatabase();

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "المساعد الصحي",
      theme: ThemeData(fontFamily: "Tajawal",primaryColor: Colors.teal, accentColor: Colors.teal,
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.teal)),
      themeMode: ThemeMode.light,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: GenerateScreen.onGenerate,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE')
      ],
      locale: Locale('ar', 'AE')
    );
  }
}
