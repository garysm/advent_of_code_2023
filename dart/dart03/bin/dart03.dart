import 'dart:io';

import 'package:dart03/dart03.dart';

Future<void> main(List<String> arguments) async {
  final input = File('./input.txt');
  final contents = await input.readAsLines();
  final fileString = await input.readAsString();
  solvePart1(contents, fileString);
}
