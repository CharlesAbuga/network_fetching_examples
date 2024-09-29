import 'package:flutter/material.dart';
import 'package:network_fetching_examples/homepage.dart';
import 'package:network_fetching_examples/theme_provider.dart';
import 'package:network_fetching_examples/themes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeChange(lightTheme),
      child: Consumer<ThemeChange>(builder: (context, theme, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: Provider.of<ThemeChange>(context).getTheme(),
          home: const HomePage(),
        );
      }),
    );
  }
}
