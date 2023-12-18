// Input format:

// winning numbers | your numbers

import 'dart:io';

import 'package:day04/day04.dart';

Future<void> main(List<String> arguments) async {
  final input = File('./input.txt');
  final contents = await input.readAsLines();
  solvePart1(contents);
}
