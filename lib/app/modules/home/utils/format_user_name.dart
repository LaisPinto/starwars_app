class FormatUserName {
  static String getAvatarLetters({required String name}) {
    final List<String> words = name.split(' ');
    return "${words.first[0]}${words.last[0]}";
  }
}
