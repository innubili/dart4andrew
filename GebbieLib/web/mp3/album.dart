part of mp3;

class Album{
  String title, picSrc, albumArtist;
  int year;
  List<Track> tracks;

  Album(){
    tracks = new List<Track>();
  }

  bool get hasTracks => tracks != null && tracks.length > 0;

  toString() => '$title [$albumArtist] (${tracks.length} tracks)';
}