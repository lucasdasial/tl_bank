import 'package:flutter/material.dart';
import 'package:tl_bank/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:tl_bank/store/app.store.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<AppStore>.value(value: AppStore())],
      child: MaterialApp(
        title: 'TL Bank',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: const Color(0xf2f2f2f2),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
          colorSchemeSeed: Colors.deepOrange,
          brightness: Brightness.light,
        ),
        home: HomePage(),
      ),
    );
  }
}
