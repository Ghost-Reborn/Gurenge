class AnimeDetails{
  final String _name;
  final String _englishName;
  final String _thumbnail;

  AnimeDetails(
      this._name,
      this._englishName,
      this._thumbnail
      );

  String get name => _name;
  String get englishName => _englishName;
  String get thumbnail => _thumbnail;
}