import 'package:web_ui/web_ui.dart';

class TrackItem extends WebComponent {
  @observable
  String tracktitle = '?';

  @observable
  String  artist = '?';

  @observable
  String  src='?';

  @observable
  String  duration='?';

  @observable
  int number = 0;

  void play() {
    print('playing: $tracktitle ...');
  }

  String get formattedTrackNumber => "${number < 10 ? '0' : ''}$number";
  String get bgColor => "${number.isOdd ? '#F8F8F8' : 'white'}";
}
