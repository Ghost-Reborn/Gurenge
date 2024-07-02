class AnimeDetails{
  final String _name;
  final String _englishName;
  final String _thumbnail;
  final List<String> _availableEpisodes;

  AnimeDetails(
      this._name,
      this._englishName,
      this._thumbnail,
      this._availableEpisodes
      );

  String get name => _name;
  String get englishName => _englishName;
  String get thumbnail => _thumbnail;
  List<String> get availableEpisodes => _availableEpisodes;
}