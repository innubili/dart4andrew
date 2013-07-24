part of mp3;

class Track{
  static int _idCnt = 0;

  Album album;
  String  title,
          artist,
          src,
          type;
  num number = 0, _id,
      duration = 0.0; // in seconds

  bool _playing = false, _paused = false;

  Track(){
    _id = ++_idCnt;
  }

  void play(){
    if (_paused)
      resume();
    else if (!_playing){
      print('playing $title ...');
      _playing = true;
    }
  }

  void pause(){
    if (_playing){
      _paused = true;
      print('paused $title ...');
    }
  }

  void resume(){
    print('resumed $title ...');
    _paused = false;
    play();
  }

  void stop(){
    if (_playing){
      print('stopped $title ...');
    }
    _playing = false;
    _paused = false;
  }

  bool get isPlaying => _playing;
  bool get isPaused => _paused;

  String get formattedDuration {
    var min = duration ~/ 60;
    var secs = duration % 60;

    var sMin = min > 9 ? '$min' : '0$min';
    var sSec = secs > 9 ? '$secs' : '0$secs';
    return "$sMin:${sSec}";
  }

  String get id => 'track_${_id}';

  String get formattedNumber => "${number < 10 ? '0' : ''}$number";

  bool get isFeatured => artist != null && artist.length > 0;

  toString() => "$formattedNumber $title ($formattedDuration) ${isFeatured ? ' - $artist' : '${album.albumArtist}'}";
}
