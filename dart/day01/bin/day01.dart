import 'dart:io';

import 'package:day01/day01.dart';

Future<void> main() async {
  final input = File('./input.txt');
  final contents = await input.readAsLines();
  final part1Result = solvePart1(contents);
  print('Part 1 : $part1Result');
  final part2Result = solvePart2(contents);
  print('Part 2 : $part2Result');
}
