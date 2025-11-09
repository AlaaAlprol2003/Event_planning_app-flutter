
import 'package:evently_app/config/providers/lang_provider_config.dart';
import 'package:evently_app/config/providers/theme_provider_config.dart';
import 'package:evently_app/config/theme/theme_manager.dart';
import 'package:evently_app/core/prefs_manager/prefs_providers.dart';
import 'package:evently_app/core/routes_manager/routes_manager.dart';
import 'package:evently_app/firebase/firebase_services.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsProviders.init();
  await Firebase.initializeApp();

  if (FirebaseAuth.instance.currentUser != null) {
    UserModel.user = await FirebaseServices.getUserFromFireStore(
      FirebaseAuth.instance.currentUser!.uid,
    );
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanagugeProvider()),
      ],
      child: Evently(),
    ),
  );
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanagugeProvider lanagugeProvider = Provider.of<LanagugeProvider>(context);
    return ScreenUtilInit(
      designSize: Size(393, 841),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
         initialRoute: RoutesManager.onboarding,
        //FirebaseAuth.instance.currentUser == null
        //     ? RoutesManager.login
        //     : RoutesManager.mainLayout,
        onGenerateRoute: RoutesManager.router,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: themeProvider.currentTheme,
        locale: Locale(lanagugeProvider.currentLang),

        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
