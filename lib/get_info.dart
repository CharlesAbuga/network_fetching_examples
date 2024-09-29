import 'package:flutter/material.dart';
import 'package:network_fetching_examples/fetch_methods.dart';
import 'package:network_fetching_examples/user.dart';
import 'package:http/http.dart' as http;

class GetInfo extends StatefulWidget {
  const GetInfo({super.key});

  @override
  State<GetInfo> createState() => _GetInfoState();
}

class _GetInfoState extends State<GetInfo> {
  late Future<List<User>> futureUser;
  @override
  void initState() {
    // TODO: implement initState
    futureUser = FetchMethods.get(http.Client());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Methods'),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          FutureBuilder(
              future: futureUser,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final user = snapshot.data as List<User>;
                  return GridView.builder(
                      shrinkWrap: true,
                      itemCount: user.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 100, crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return ListTile(
                          tileColor: Theme.of(context).colorScheme.surface,
                          style: ListTileStyle.list,
                          title: Text(user[index].name),
                          subtitle: Text(user[index].email),
                          leading: CircleAvatar(),
                        );
                      });
                }
              }),
          const SizedBox(height: 20),
        ]))));
  }
}
