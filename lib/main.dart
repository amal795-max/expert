import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helper/local_storage.dart';
import 'core/routing/router.dart';
import 'core/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocalStorage().init();
  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[Locale('en'), Locale('ar')],
      path: 'assets/language',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'SolarHub',
                darkTheme: AppThemes.darkTheme,
                theme: AppThemes.lightTheme,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: Locale('ar'),
                localeResolutionCallback: (deviceLocal, supportedLocales) {
                  for (var local in supportedLocales) {
                    if (deviceLocal != null && deviceLocal.languageCode == local.languageCode) {
                      return deviceLocal;
                    }
                  }
                  return supportedLocales.first;
                },
                routerConfig: router,
              );
            },

    );
  }
}
