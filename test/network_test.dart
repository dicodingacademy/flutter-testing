import 'package:search_users/model/user.dart';
import 'package:search_users/network/user_api_request.dart';
import 'package:search_users/network/user_api_response_mapper.dart';

import 'package:test_api/test_api.dart';
import 'package:mockito/mockito.dart';

import 'package:http/http.dart' as http;

class ApiTest extends Mock implements http.Client {}

main() {
  final client = ApiTest();

  group("Request search user with query dicoding", () {
    test("should request complete", () async {
      when(
        client.get("https://api.github.com/search/users?q=dicoding"),
      ).thenAnswer(
        (_) async => http.Response(parseUsers([]).toString(), 200),
      );

      expect(await searchUser("dicodingacademy"), isA<List<User>>());
    });

    test("should request failed", () async {
      when(
        client.get("https://api.github.com/search/users?q=dicoding"),
      ).thenAnswer(
        (_) async => http.Response(parseUsers([]).toString(), 404),
      );

      expect(await searchUser("dicodingacademy"), isA<List<User>>());
    });
  });

  group("Request detail user", () {
    test("should request complete", () async {
      when(
        client.get("https://api.github.com/users/dicodingacademy"),
      ).thenAnswer(
        (_) async => http.Response(parseUsers([]).toString(), 200),
      );

      expect(await searchUser("dicodingacademy"), isA<List<User>>());
    });

    test("should request failed", () async {
      when(
        client.get("https://api.github.com/users/dicodingacademy"),
      ).thenAnswer(
        (_) async => http.Response(parseUsers([]).toString(), 404),
      );

      expect(await searchUser("dicodingacademy"), isA<List<User>>());
    });
  });
}
