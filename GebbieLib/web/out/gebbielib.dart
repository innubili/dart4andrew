// Auto-generated from gebbielib.html.
// DO NOT EDIT.

library gebbielib_html;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'trackitem.dart';
import 'dart:html';
import 'package:web_ui/web_ui.dart';
import '../mp3/mp3.dart';


// Original code


void main() {
  var musicInfo = fetchMusicInfo();
  var selector = getArtistSelector(musicInfo);
  document.body.append(selector);
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
 * retrns a (html) ordered list with tracks
 */
getTrackSelector(List<Track> tracks){
  Element selector = new OListElement()
                         ..classes.add('selector');

  tracks.forEach((track){
    var li = new LIElement();
    li.text = track.toString();
    selector.append(li);
  });

  return selector;
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
        ..artist = cnt == 5 ? 'John' : ''
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
// Additional generated code
void init_autogenerated() {
  var __root = autogenerated.document.body;
  var __e0, __e1, __e2;
  var __t = new autogenerated.Template(__root);
  __e0 = __root.nodes[5];
  __t.bind(() => null,  (__e) { __e0.xtag.artist = 'J.S. Fiddes'; }, true);
  __t.bind(() => null,  (__e) { __e0.xtag.duration = '03:12'; }, true);
  __t.oneWayBind(() => 1, (e) { if (__e0.xtag.number != e) __e0.xtag.number = e; }, false, false);
  __t.bind(() => null,  (__e) { __e0.xtag.tracktitle = 'my title'; }, true);
  __t.component(new TrackItem()..host = __e0);
  __e1 = __root.nodes[7];
  __t.bind(() => null,  (__e) { __e1.xtag.artist = 'J.S. Fiddes'; }, true);
  __t.bind(() => null,  (__e) { __e1.xtag.duration = '03:12'; }, true);
  __t.oneWayBind(() => 2, (e) { if (__e1.xtag.number != e) __e1.xtag.number = e; }, false, false);
  __t.bind(() => null,  (__e) { __e1.xtag.tracktitle = 'your title'; }, true);
  __t.component(new TrackItem()..host = __e1);
  __e2 = __root.nodes[9];
  __t.bind(() => null,  (__e) { __e2.xtag.artist = 'J.S. Fiddes'; }, true);
  __t.bind(() => null,  (__e) { __e2.xtag.duration = '03:12'; }, true);
  __t.oneWayBind(() => 3, (e) { if (__e2.xtag.number != e) __e2.xtag.number = e; }, false, false);
  __t.bind(() => null,  (__e) { __e2.xtag.tracktitle = 'your title'; }, true);
  __t.component(new TrackItem()..host = __e2);
  __t.create();
  __t.insert();
}

//# sourceMappingURL=gebbielib.dart.map