import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_and_down_mobile/cores/data/config/config.dart';
import 'package:up_and_down_mobile/cores/presentation/bloc/bloc.dart';
import 'package:up_and_down_mobile/cores/styles/styles.dart';
import 'package:up_and_down_mobile/cores/utils/util.dart';
import 'package:up_and_down_mobile/features/splash_screen/view/splash_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  var configSource = await rootBundle.loadString("config.json");
  var jsonConfig = jsonDecode(configSource);
  Config.env = Env.fromJson(jsonConfig);

  await UtilGlobal.init();
  Style.init();

  runApp(EasyLocalization(
      supportedLocales: const [Locale("id", "")],
      fallbackLocale: const Locale("id"),
      path: "assets/lang",
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => GlobalBloc())],
        child: const App(),
      )));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();

}

class _AppState extends State<App> {

  @override
  void initState() {
    UtilGlobal.setContext(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Up&Down",
      routes: route,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        primaryColor: color.primaryColor
      ),
      initialRoute: SplashScreenView.routeName,
    );
  }
}
