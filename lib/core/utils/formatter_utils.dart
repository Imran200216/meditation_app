// Audio Time Formatter
String audioTimeFormatter(Duration d) {
  return "${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}";
}
