import 'package:flutter/material.dart';
import 'package:network_fetching_examples/get_info.dart';
import 'package:network_fetching_examples/post_info.dart';
import 'package:network_fetching_examples/theme_provider.dart';
import 'package:network_fetching_examples/themes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool light0 = true;

  final WidgetStateProperty<Icon?> thumbIcon =
      WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(Icons.sunny);
      }
      return const Icon(Icons.nightlight_round, color: Colors.black);
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Consumer<ThemeChange>(builder: (context, theme, child) {
              return Row(
                children: [
                  Text('Fetching Methods',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface)),
                  const Spacer(),
                  Switch(
                      thumbColor: const WidgetStatePropertyAll(Colors.white),
                      thumbIcon: thumbIcon,
                      activeColor: Colors.black,
                      inactiveThumbColor: Colors.black,
                      value: light0,
                      onChanged: (value) {
                        setState(() {
                          light0 = value;
                          if (light0) {
                            theme.setTheme(lightTheme);
                          } else {
                            theme.setTheme(darkTheme);
                          }
                        });
                      }),
                ],
              );
            })),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).colorScheme.onSurface),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const GetInfo()));
                  },
                  child: Text('GET',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).colorScheme.onSurface),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const PostInfo();
                    }));
                  },
                  child: Text('POST',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).colorScheme.onSurface),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/put');
                  },
                  child: Text('PUT',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).colorScheme.onSurface),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/delete');
                  },
                  child: Text('DELETE',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface)),
                ),
              ],
            ),
          ),
        ));
  }
}
