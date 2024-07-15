class EpisodeDetails{
  final String _episode;
  final String _episodeName;
  final String _thumbnail;

  EpisodeDetails(
      this._episode,
      this._episodeName,
      this._thumbnail,
      );

  String get episode => _episode;
  String get episodeName => _episodeName;
  String get thumbnail => _thumbnail;
}