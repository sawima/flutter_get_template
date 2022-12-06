import 'package:deviceweb/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/translate/translate_message.dart';
import 'routers/myRouters.dart';
import 'config/constants.dart';
import 'config/themes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<HomeController>(HomeController(),permanent: true);
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
      // supportedLocales: [
      //   const Locale('en', ''),
      //   const Locale.fromSubtags(languageCode: 'zh'),
      // ],
      debugShowCheckedModeBanner: false,
      translations: TranslateMessages(),
      locale: const Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
      fallbackLocale: const Locale('en', 'US'),
      title: kMaterialAppTitle,
      theme: AppTheme.light,
      initialRoute: MyRouters.main,
      getPages: MyRouters.getPages,
    );
  }
}