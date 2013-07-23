part of mp3;

class Track{
  Album album;
  String  title,
          artist,
          src,
          type;
  num number = 0,
      duration = 0.0; // in seconds

  Track(){}

  String get formattedDuration {
    var min = duration ~/ 60;
    var secs = duration % 60;

    var sMin = min > 9 ? '$min' : '0$min';
    var sSec = secs > 9 ? '$secs' : '0$secs';
    return "$sMin:${sSec}";
  }
  String get formattedNumber => "${number < 10 ? '0' : ''}$number";

  bool get isFeatured => artist != null && artist.length > 0;

  toString() => "$formattedNumber $title ($formattedDuration) ${isFeatured ? ' - $artist' : '${album.albumArtist}'}";
}
