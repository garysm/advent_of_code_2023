void solvePart1(List<String> fileContents, String fileString) {
  int sum = 0;
  final List<List<String?>> inputGrid = List<List<String?>>.generate(
    140,
    (i) => List<String?>.generate(
      140,
      (index) => null,
      growable: false,
    ),
    growable: false,
  );
  for (final (int index, row) in inputGrid.indexed) {
    final line = fileContents[index];
    for (int i = 0; i < line.length; i++) {
      row[i] = line[i];
    }
  }
  final regex = RegExp(r'(\d+)');
  final matches = regex.allMatches(fileString);
  for (final match in matches) {
    final RegExp symbolRegex = RegExp(r'([-!$%^&*()_+|~=`{}\[\]:;<>?#@,\/])');
  }
  // for (final match in matches) {
  //   final RegExp symbolRegex = RegExp(r'([-!$%^&*()_+|~=`{}\[\]:;<>?#@,\/])');
  //   final String number = match[0]!;
  //   final int value = int.parse(number);
  //   final int leftSymbolIndex = fileContents.indexOf(number) - 1;
  //   final int rightSymbolIndex = fileContents.indexOf(number) + number.length;
  //   final String leftSymbol = fileContents[leftSymbolIndex];
  //   final String rightSymbol = fileContents[rightSymbolIndex];
  //   if (leftSymbol.contains(symbolRegex) | rightSymbol.contains(symbolRegex)) {
  //     sum += value;
  //   }
  // }
  // print('Part 1: $sum');
}
