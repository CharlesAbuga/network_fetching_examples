import 'package:flutter/material.dart';
import 'package:network_fetching_examples/fetch_methods.dart';
import 'package:network_fetching_examples/user.dart';

class PostInfo extends StatefulWidget {
  const PostInfo({super.key});

  @override
  State<PostInfo> createState() => _PostInfoState();
}

class _PostInfoState extends State<PostInfo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Future<User>? futureUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Info')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: (futureUser != null)
                ? const Column(children: [
                    Text('Sent Successfully'),
                  ])
                : Column(
                    children: [
                      const SizedBox(height: 20),
                      const TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                          // Add your code here
                          futureUser = FetchMethods.post(User(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              username: 'username'));
                        },
                        child: const Text('Post'),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
