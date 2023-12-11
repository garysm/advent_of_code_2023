const Map<String, String> digitStringValues = {
  'one': '1',
  'two': '2',
  'three': '3',
  'four': '4',
  'five': '5',
  'six': '6',
  'seven': '7',
  'eight': '8',
  'nine': '9',
};

int solvePart1(List<String> fileContents) {
  return calculateCalibrationSum(
    fileContents,
    regexp: RegExp(r'([1-9])'),
  );
}

int solvePart2(List<String> fileContents) {
  return calculateCalibrationSum(
    fileContents,
    regexp: RegExp(r'(?=([1-9]|one|two|three|four|five|six|seven|eight|nine))'),
  );
}

int calculateCalibrationSum(List<String> input, {required RegExp regexp}) {
  int sum = 0;
  for (final string in input) {
    if (!regexp.hasMatch(string)) return 0;
    final matches = regexp.allMatches(string);
    String firstDigit = matches.first[1]!;
    String lastDigit = matches.last[1]!;
    firstDigit = checkSpelledOut(firstDigit);
    lastDigit = checkSpelledOut(lastDigit);

    final number = int.parse('$firstDigit$lastDigit');
    sum += number;
  }
  return sum;
}

String checkSpelledOut(String digit) {
  if (digitStringValues.keys.contains(digit)) {
    return digitStringValues[digit]!;
  }
  return digit;
}
