// Auto-generated from trackitem.html.
// DO NOT EDIT.

library track_item;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'package:web_ui/web_ui.dart';



class TrackItem extends WebComponent with Observable  {
  /** Autogenerated from the template. */

  autogenerated.ScopedCssMapper _css;

  /** This field is deprecated, use getShadowRoot instead. */
  get _root => getShadowRoot("track-item");
  static final __shadowTemplate = new autogenerated.DocumentFragment.html('''
        <div style="background-color:{{bgColor}}">
          <span style="margin-right:0.2em; display: inline-table;"></span>
          <span style="display: inline-table;"></span>
          <span style="display: inline-table; color:gray"></span>
          <span style="display: inline-table;"></span>
          <span style="display: inline-table; cursor:pointer" title="play">►</span>
        </div>
      ''');
  autogenerated.DivElement __e9;
  autogenerated.SpanElement __e1, __e3, __e5, __e7, __e8;
  autogenerated.Template __t;

  void created_autogenerated() {
    var __root = createShadowRoot("track-item");
    setScopedCss("track-item", new autogenerated.ScopedCssMapper({"track-item":"[is=\"track-item\"]"}));
    _css = getScopedCss("track-item");
    __t = new autogenerated.Template(__root);
    __root.nodes.add(__shadowTemplate.clone(true));
    __e9 = __root.nodes[1];
    __e1 = __e9.nodes[1];
    var __binding0 = __t.contentBind(() => formattedTrackNumber, false);
    __e1.nodes.add(__binding0);
    __e3 = __e9.nodes[3];
    var __binding2 = __t.contentBind(() => tracktitle, false);
    __e3.nodes.add(__binding2);
    __e5 = __e9.nodes[5];
    var __binding4 = __t.contentBind(() => duration, false);
    __e5.nodes.addAll([new autogenerated.Text('('),
        __binding4,
        new autogenerated.Text(')')]);
    __e7 = __e9.nodes[7];
    var __binding6 = __t.contentBind(() => artist, false);
    __e7.nodes.add(__binding6);
    __e8 = __e9.nodes[9];
    __t.listen(__e8.onClick, ($event) { play(); });
    __t.bind(() => bgColor,  (__e) { __e9.attributes['style'] = 'background-color:${__e.newValue}'; }, false);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e9 = __e1 = __e3 = __e5 = __e7 = __e8 = null;
  }

  /** Original code from the component. */

  String __$tracktitle = '?';
  String get tracktitle {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'tracktitle');
    }
    return __$tracktitle;
  }
  set tracktitle(String value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'tracktitle',
          __$tracktitle, value);
    }
    __$tracktitle = value;
  }

  String __$artist = '?';
  String get artist {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'artist');
    }
    return __$artist;
  }
  set artist(String value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'artist',
          __$artist, value);
    }
    __$artist = value;
  }

  String __$src = '?';
  String get src {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'src');
    }
    return __$src;
  }
  set src(String value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'src',
          __$src, value);
    }
    __$src = value;
  }

  String __$duration = '?';
  String get duration {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'duration');
    }
    return __$duration;
  }
  set duration(String value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'duration',
          __$duration, value);
    }
    __$duration = value;
  }

  int __$number = 0;
  int get number {
    if (__observe.observeReads) {
      __observe.notifyRead(this, __observe.ChangeRecord.FIELD, 'number');
    }
    return __$number;
  }
  set number(int value) {
    if (__observe.hasObservers(this)) {
      __observe.notifyChange(this, __observe.ChangeRecord.FIELD, 'number',
          __$number, value);
    }
    __$number = value;
  }

  void play() {
    print('playing: $tracktitle ...');
  }

  String get formattedTrackNumber => "${number < 10 ? '0' : ''}$number";
  String get bgColor => "${number.isOdd ? '#F8F8F8' : 'white'}";
}

//# sourceMappingURL=trackitem.dart.map