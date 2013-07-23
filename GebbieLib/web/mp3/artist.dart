part of mp3;

class Artist{
  String name, nickName, wikiLink;

  List<Album> albums;

  Artist(){
    albums = new List<Album>();
  }

  bool get hasAlbums => albums != null && albums.length > 0;

  toString() => "$name ${(nickName != null && nickName.length > 0) ? '(also called $nickName)' : ''} ${albums.length} albums";
}