import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'routers/myRouters.dart';
import 'config/constants.dart';
import 'config/themes.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await Hive.openBox('kimacloudbox');
  // CacheService();
  // Get.put(CacheService());
  // await GetStorage.init();
  // await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale.fromSubtags(languageCode: 'zh'),
      ],
      debugShowCheckedModeBanner: false,
      title: kMaterialAppTitle,
      theme: AppTheme.light,
      initialRoute: MyRouters.main,
      getPages: MyRouters.getPages,
    );
  }
}