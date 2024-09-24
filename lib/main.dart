import 'package:flutter/material.dart';
import 'package:pad_mes/common/global.dart';
import 'package:pad_mes/routes/page_router.dart';
import 'package:pad_mes/states/mock_provider.dart';
import 'package:pad_mes/states/user_provider.dart';
import 'package:provider/provider.dart';
void main(){
  Global.init().then((e) =>
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => MockProvider())
        ],
        child: const MyApp()
      )
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cube Mes System',
      initialRoute: '/',
      theme: ThemeData(),
      onGenerateRoute: PageRouter.router.generator,
    );
  }
}
