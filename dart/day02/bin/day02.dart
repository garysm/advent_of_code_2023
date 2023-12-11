import 'dart:io';

import 'package:day02/day02.dart';

Future<void> main() async {
  final input = File('./input.txt');
  final contents = await input.readAsLines();
  solvePart1(contents);
  solvePart2(contents);
}
