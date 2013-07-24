import 'dart:html';
import 'package:web_ui/web_ui.dart';

import 'mp3/mp3.dart';

Element artistSelector;
Map<String, Track> allTracks; // map<element id, track object>
String selectedTrackId;

void main() {
  allTracks = new Map<String, Track>();
  var musicInfo = fetchMusicInfo();
  artistSelector = getArtistSelector(musicInfo);
  document.body.append(artistSelector);
}

/**
 * returns a (html) ordered list with artist
 */
getArtistSelector(List<Artist> artists){
  var selector = new OListElement()
  ..classes.add('selector');

  artists.forEach((artist){
    LIElement li = getArtistItem(artist);
    selector.append(li);
  });
  return selector;
}


/**
 * retrns an (html) ordered list with albums
 */
getAlbumSelector(List<Album> albums){
  var selector = new OListElement()
                     ..classes.add('selector');

  albums.forEach((album){
    LIElement li = getAlbumItem(album);
    selector.append(li);
  });

  return selector;
}

/**
 * returns a (html) ordered list with tracks
 * !!! unfortunately web-ui components cannot be 'build' programmatically yet
 * !!! so we'll build dem dynamically as standard html
getTrackSelector(List<Track> tracks){
  Element selector = new DivElement()..classes.add('trackSelector');

  tracks.forEach((track){
    // in dart yo can do multi-line strings with '''
    String trackDiv = '<div is="track-item" id="${track.id}" number="${track.number}" tracktitle="${track.title}" artist="${track.artist}" duration="${track.formattedDuration}"></div>';
    selector.appendHtml(trackDiv);
  });

  return selector;
}
*/

/***
 * returns a (html) table with tracks
 */
getTrackSelector(List<Track> tracks){
  Element selector = new TableElement()..classes.add('trackSelector');
  selector.append(trackHeader);
  tracks.forEach((track){
    // in dart yo can do multi-line strings with '''
    Element trackDiv = getTrackItem(track);
    selector.append(trackDiv);
    if(!allTracks.containsValue(track)) allTracks[track.id] = track;
  });
  return selector;
}

/***
 * return the (html) table-row for the tracks
 */
get trackHeader{
  var div = new TableRowElement()..classes.add("track trackHeader");
  div.append(new TableCellElement()..text = 'Nr');
  div.append(new TableCellElement()..text = '');
  div.append(new TableCellElement()..text = 'Title');
  div.append(new TableCellElement()..text = 'Artist');
  div.append(new TableCellElement()..text = 'mm:ss');
  div.append(new TableCellElement()..classes.add('spacer'));
  return div;
}

/***
 * returns a (html) table-row with the track data
 */
getTrackItem(Track track){
  var div = new TableRowElement()
          ..id = track.id
          ..classes.add("track ${track.number.floor().isOdd ? 'alternateBright' : 'alternateDark'}");
  div.append(new TableCellElement()..text = track.formattedNumber..classes.add('nr'));
  var playBtn = new TableCellElement()
    ..id = '${track.id}_btn'
    ..innerHtml = '&#9658;'
    ..classes.add('play')
    ..title = 'play'
    ..onClick.listen((e){toggleTrackPlay(track);});
  div.append(playBtn);
  div.append(new TableCellElement()..text = track.title..classes.add('title textCol'));
  div.append(new TableCellElement()..text = track.artist..classes.add('artist textCol'));
  div.append(new TableCellElement()..text = track.formattedDuration..classes.add('duration'));
  div.append(new TableCellElement()..classes.add('spacer'));
  div.onClick.listen((e){setTrackSelection(e.currentTarget.id, true);});
  return div;
}

/***
 * set if a track is selected (or not)...
 */
setTrackSelection(trackId, selected){
  if (selectedTrackId != trackId) setTrackSelection(selectedTrackId, false);
  Element trackEl = document.query('#$trackId');
  if(trackEl != null){
    if(selected){
      print('  -selected $trackId');
      trackEl.classes.add('selectedTrack');
      selectedTrackId = trackId;
    }else{
      print('UN-selected $trackId');
      trackEl.classes.remove('selectedTrack');
      stopPlaying(allTracks[selectedTrackId]);
      selectedTrackId = null;
    }
  }
}

/***
 * (will) plays & stops a track
 */
toggleTrackPlay(track){
  if(track.isPlaying)
    stopPlaying(track);
  else
    startPlaying(track);
}


/***
 * (will) stop playing a track and update button on UI
 */
startPlaying(track){
  Element playBtn = document.query('#${track.id}_btn');
  if(playBtn != null){
    playBtn
    ..innerHtml = '&#9632;'
    ..classes.add('stoppable')
    ..title = 'stop';
    track.play();
  }
}
/***
 * (will) stop playing a track and update button on UI
 */
stopPlaying(track){
  Element playBtn = document.query('#${track.id}_btn');
  if(playBtn != null){
    playBtn
    ..innerHtml = '&#9658;'
    ..classes.remove('stoppable')
    ..title = 'play';
    track.stop();
  }
}

/**
 * returns a (html) list-item with the artist
 */
getArtistItem(artist){
  LIElement artistListItem = new LIElement();
  if (artist.hasAlbums){
    Element albumSelector = getAlbumSelector(artist.albums)..classes.add('hidden');
    SpanElement selectable = new SpanElement()..text = artist.toString();
    ButtonElement button = new ButtonElement()..text = '+';
    button.onClick.listen((e){
      if (button.text == '+'){
        button
        ..text = '-'
        ..title = 'collapse';
        albumSelector.classes.remove('hidden');
        selectable.classes.add('selectedText');
        artistListItem.classes.add('selectedItem');
      }else {
        button
        ..text = '+'
        ..title = 'expand';
        albumSelector.classes.add('hidden');
        selectable.classes.remove('selectedText');
        artistListItem.classes.remove('selectedItem');
      }
    });
    artistListItem.append(button);
    artistListItem.append(selectable);
    artistListItem.append(albumSelector);
  }
  return artistListItem;
}

/**
 * returns a (html) list-item with the album
 */
getAlbumItem(album){
  LIElement albumListItem = new LIElement();

  if (album.hasTracks){
    Element albumSelector = getTrackSelector(album.tracks)..classes.add('hidden');
    SpanElement selectable = new SpanElement()..text = album.toString();
    ButtonElement button = new ButtonElement()..text = '+';
    button.onClick.listen((e){
      if (button.text == '+'){
        button.text = '-';
        albumSelector.classes.remove('hidden');
        selectable.classes.add('selectedText');
        albumListItem.classes.add('selectedItem');
      }else {
        button.text = '+';
        albumSelector.classes.add('hidden');
        selectable.classes.remove('selectedText');
        albumListItem.classes.remove('selectedItem');
      }
    });
    albumListItem.append(button);
    albumListItem.append(selectable);
    albumListItem.append(albumSelector);
  }
  return albumListItem;
}

/**
 * replace this with a function that kicks the info fetcher
 * (e.g. get the list from a window media server) and once
 * received update the UI (list viewer)
 */
List<Artist> fetchMusicInfo(){
  var artists = new List<Artist>();
  var cnt = 1;
  var artistNames = ["A.gebbie", "The Gebbies", "Rudy"];

  artistNames.forEach((name){
    var artist = new Artist()..name = name;
    for(int iA=1; iA <= 3; iA++){
      var album = new Album()
      ..title = 'Album_$iA'
      ..albumArtist = artist.name;
      for(var iT=1; iT<= 10; iT++){
        var track = new Track()
        ..title = 'title-$iA $iT'
        ..duration = 180 + 25 * iT + iA
        ..artist = cnt == 5 ? 'John' : album.albumArtist
        ..album = album
        ..number = iT;
        album.tracks.add(track);
        cnt++;
      }
      artist.albums.add(album);
    }
    artists.add(artist);
  });
  return artists;
}