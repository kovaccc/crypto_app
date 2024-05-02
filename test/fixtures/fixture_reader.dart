import 'dart:convert';
import 'dart:io';

Map<String, dynamic> decodeFixture(String name) =>
    json.decode(_fixture('$name.json'));

String _fixture(String name) => File('test/fixtures/$name').readAsStringSync();
