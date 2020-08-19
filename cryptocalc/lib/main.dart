
import 'package:cryptocalc/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'styles/colors.dart';
import 'styles/loader.dart';
// Pages
import 'views/calc/calc.dart';
import 'views/trade/trade.dart';
import 'views/graph/graph.dart';
import 'views/pay/pay.dart';
import 'views/admin/admin.dart';
// Auth
import 'views/passwordRecovery/passwordRecovery.dart';
import 'views/login/login.dart';
import 'views/signin/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'api/auth.dart';
//i18N
import 'package:flutter_localizations/flutter_localizations.dart';
import 'i18n/AppLanguage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(
    ChangeNotifierProvider<AuthService>(
      child: MyApp(
        appLanguage: appLanguage
      ),
      builder: (BuildContext context) {
        return AuthService();
      },
    )
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key key, this.appLanguage}) : super(key: key);
  final AppLanguage appLanguage;

  @override
  _MyAppState createState() => _MyAppState(appLanguage);
}

class _MyAppState extends State<MyApp> {

  final AppLanguage appLanguage;

  _MyAppState(this.appLanguage);

  @override
  Widget build(BuildContext context) {

      return ChangeNotifierProvider<AppLanguage>(
        builder: (_) => appLanguage,
        child: Consumer<AppLanguage>(builder: (context, model, child) {
            return MaterialApp(
            // i18N
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
                const Locale('en', 'US'), // Inglés
                const Locale('es', 'ES'), // Español
                const Locale('pt', 'PT'), // Portugués
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              // Check if the current device locale is supported
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode &&
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              // If the locale of the device is not supported, use the first one
              // from the list (English, in this case).
              return supportedLocales.first;
            },
            // HOME
            home: FutureBuilder<FirebaseUser>(
              future: Provider.of<AuthService>(context).getUser(),
              builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // log error to console 
                  if (snapshot.error != null) { 
                    print("error");
                    return Text(snapshot.error.toString());
                  }

                  // redirect to the proper page
                  return snapshot.hasData ? Calc() : Login();
                } else {
                  // show loading indicator
                  return LoadingCircle();
                }
              },
            ),

            //ROUTES
            routes: <String, WidgetBuilder>{
              "/calc": (BuildContext context) => new Calc(),
              "/login": (BuildContext context) => new Login(),
              "/signin": (BuildContext context) => new Signin(),
              "/passwordRecovery": (BuildContext context) => new PasswordRecovery(),
              // PAGES
              //"/home": (BuildContext context) => new Calc(),
              "/trade": (BuildContext context) => new Trade(),
              "/graph": (BuildContext context) => new Graph(),
              "/pay": (BuildContext context) => new Pay(),
              "/admin": (BuildContext context) => new Admin(),
            },
            initialRoute: "/login",
            title: 'CryptoCalc V2.0',
            theme: ThemeData(
              fontFamily: 'Lato',
              primaryColor: MustardColor,
            ));
        }
      ));

  }
}




