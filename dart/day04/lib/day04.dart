void solvePart1(List<String> fileContents) {
  int sum = 0;

  final numbersRegex = RegExp(r'\d+');

  for (final line in fileContents) {
    int cardValue = 0;
    final numbersContent = line.split(':');
    final numbers = numbersContent[1].split('|');
    final winningNumbers = numbersRegex.allMatches(numbers[0]);
    final yourNumbers = numbersRegex.allMatches(numbers[1]);

    for (final match in yourNumbers) {
      final int matchNumber = int.parse(match[0]!);
      for (final winningMatch in winningNumbers) {
        final int winningMatchNumber = int.parse(winningMatch[0]!);
        if (matchNumber == winningMatchNumber) {
          if (cardValue == 0) {
            cardValue += 1;
          } else {
            cardValue *= 2;
          }
        }
      }
    }

    sum += cardValue;
  }
  print(sum);
}
