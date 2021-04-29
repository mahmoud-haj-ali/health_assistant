import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:haelth_app/features/home/presintation/page/home_page.dart';
import 'package:sizer/sizer_util.dart';
import 'core/data_base/db/moor_db.dart';
import 'core/util/generate_screen.dart';

final db = MyDatabase();

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        return OrientationBuilder(
          builder: (context,orientation){
            SizerUtil().init(constraints, orientation);
            return GetMaterialApp(
                title: "المساعد الصحي",
                theme: ThemeData(fontFamily: "Tajawal",
                    primaryColor: Colors.teal,
                    accentColor: Colors.teal,
                    appBarTheme: AppBarTheme(brightness: Brightness.dark)),
                home: HomePage(),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: GenerateScreen.onGenerate,
                localizationsDelegates: [
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                themeMode: ThemeMode.dark,
                builder: (_,child){
                  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
                    statusBarColor: Colors.transparent,
                  ));
                  return child;
                },
                supportedLocales: [
                  Locale('ar', 'AE')
                ],
                locale: Locale('ar', 'AE')
            );
          },
        );
      });
  }
}