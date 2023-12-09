import 'dart:io';

Future<int> solvePart1(String filePath) async {
  solvePart1('../input.txt');
  final input = File('../input.txt');
  final contents = await input.readAsLines();
  return calculateCalibrationSum(contents);
}

int calculateCalibrationSum(List<String> input) {
  final regexp = RegExp(r'([1-9])');
  int sum = 0;
  for (var string in input) {
    final digits = regexp.allMatches(string);
    if (digits.isEmpty) return 0;
    final number = int.parse('${digits.first[0]!}${digits.last[0]!}');
    sum += number;
  }
  return sum;
}
