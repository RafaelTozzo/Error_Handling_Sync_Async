void main() {
  print(stringToInt('R'));
}

int stringToInt(String text) {
  int value;

  try {
    value = int.parse(text);
  } catch (e) {
    throw Exception('The text passed:($text) is not a number!');
  }
  return value;
}
