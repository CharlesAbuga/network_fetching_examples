import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_fetching_examples/fetch_methods.dart';
import 'package:network_fetching_examples/user.dart';

import 'fetch_methods_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('A group for fetching data using API', () {
    test('Returns a user when executed peroperly', () async {
      final client = MockClient();
      when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/users')))
          .thenAnswer((_) async => http.Response(
              '[{"name": "Leanne Graham", "email": "leanne@example.com", "username": "Bret", "phone": "1-770-736-8031"}]',
              200));
      expect(await FetchMethods.get(client), isA<List<User>>());
    });
  });
}
