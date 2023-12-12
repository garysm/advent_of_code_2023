import 'dart:io';

import 'package:day03/day03.dart';

Future<void> main(List<String> arguments) async {
  final input = File('./input.txt');
  final contents = await input.readAsLines();
  solvePart1(contents);
}
