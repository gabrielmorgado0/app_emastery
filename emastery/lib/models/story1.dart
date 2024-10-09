class Story {
  final String title;    // Título da história
  final String content;  // Texto completo da história
  final String audioUrl; // URL do áudio que corresponde à história
  final Map<String, String> translations; // Mapeia palavras a suas traduções

  Story({
    required this.title,
    required this.content,
    required this.audioUrl,
    required this.translations,
  });
}
