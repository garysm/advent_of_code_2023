const redCubes = 12;
const greenCubes = 13;
const blueCubes = 14;

void solvePart1(List<String> fileContents) {
  final solution = sumIds(fileContents);
  print('Part 1: $solution');
}

void solvePart2(List<String> fileContents) {
  int sum = 0;
  for (final line in fileContents) {
    int redMax = 0;
    int greenMax = 0;
    int blueMax = 0;
    final regex = RegExp(r'(\d+ (green|blue|red))');
    final matches = regex.allMatches(line);
    for (final match in matches) {
      final content = match[0]!.split(' ');
      final digit = int.parse(content[0]);
      final color = content[1];
      switch (color) {
        case 'red':
          if (digit > redMax) {
            redMax = digit;
          }
          break;
        case 'green':
          if (digit > greenMax) {
            greenMax = digit;
          }
          break;
        case 'blue':
          if (digit > blueMax) {
            blueMax = digit;
          }
          break;
      }
    }
    final power = redMax * greenMax * blueMax;
    sum += power;
  }
  print('Part 2: $sum');
}

int sumIds(List<String> fileContents) {
  int sum = 0;
  for (final line in fileContents) {
    final parts = line.split(':');
    final gameIdContent = parts[0];
    final gameContent = parts[1];
    final idRegex = RegExp(r'(\d+)');
    final id = int.parse(idRegex.firstMatch(gameIdContent)![0]!);
    final bool gameValid = checkGamePossible(gameContent);
    if (gameValid) {
      sum += id;
    }
  }
  return sum;
}

bool checkGamePossible(String gameContent) {
  List<String> sets = gameContent.split(';');
  for (final game in sets) {
    final cubes = game.split(', ');
    for (String cube in cubes) {
      cube = cube.trim();
      final values = cube.split(' ');
      final value = int.parse(values[0]);
      final color = values[1];
      switch (color) {
        case 'red':
          if (value > redCubes) return false;
          break;
        case 'green':
          if (value > greenCubes) return false;
          break;
        case 'blue':
          if (value > blueCubes) return false;
        default:
          return false;
      }
    }
  }
  return true;
}
