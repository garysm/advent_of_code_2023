void solvePart1(List<String> fileContents) {
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
  // Insert values first
  for (final (int index, row) in inputGrid.indexed) {
    final line = fileContents[index];
    for (int i = 0; i < line.length; i++) {
      row[i] = line[i];
    }
  }
  final numberRegex = RegExp(r'(\d+)');
  final symbolRegex = RegExp(r'([-!$%^&*()_+|~=`{}\[\]:;<>?#@,\/])');

  for (int i = 0; i < inputGrid.length; i++) {
    final line = fileContents[i];
    final matches = numberRegex.allMatches(line);
    for (final match in matches) {
      bool symbolAdjacent = false;
      final numberString = match[0]!;
      final numberValue = int.parse(numberString);
      final numberStartIndex = line.indexOf(numberString);
      final numberEndIndex = numberStartIndex - 1 + numberString.length;
      // Check surrounding characters for symbols
      // Check above the number for adjacent symbols
      int startIndex = numberStartIndex - 1;
      int endIndex = numberEndIndex + 1;
      List<String> charsToCheck = [];
      if (i > 0) {
        final lineAbove = inputGrid[i - 1];
        final lineAboveEndIndex = lineAbove.length - 1;
        if (numberStartIndex == 0) startIndex = 0;
        if (numberEndIndex == lineAboveEndIndex) endIndex = lineAboveEndIndex;
        for (int j = startIndex; j <= endIndex; j++) {
          charsToCheck.add(lineAbove[j]!);
        }
      }
      // Check below the number
      if (i < inputGrid.length - 1) {
        final lineBelow = inputGrid[i + 1];
        final lineBelowEndIndex = lineBelow.length - 1;
        startIndex = numberStartIndex - 1;
        endIndex = numberEndIndex + 1;
        if (numberStartIndex == 0) startIndex = 0;
        if (numberEndIndex == lineBelowEndIndex) endIndex = lineBelowEndIndex;
        for (int j = startIndex; j <= endIndex; j++) {
          charsToCheck.add(lineBelow[j]!);
        }
      }
      // Finally check to the left and right
      final currentLine = inputGrid[i];
      final lineEndIndex = currentLine.length - 1;
      startIndex = numberStartIndex - 1;
      endIndex = numberEndIndex + 1;
      if (numberStartIndex == 0) {
        startIndex = 0;
      }
      if (numberEndIndex == lineEndIndex) {
        endIndex = lineEndIndex;
      }
      charsToCheck.add(currentLine[startIndex]!);
      charsToCheck.add(currentLine[endIndex]!);
      for (final symbol in charsToCheck) {
        final match = symbolRegex.firstMatch(symbol);
        if (match != null) symbolAdjacent = true;
      }
      if (symbolAdjacent == true) sum += numberValue;
    }
  }
  print(sum);
}
