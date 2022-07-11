library bloc;

// import 'package:flutter/foundation.dart';

import '../injector.dart';
import '../model/model.dart';
import '../service/service.dart';

part 'home.dart';
part 'entry.dart';
part 'profile.dart';
part 'ide_bisnis.dart';
part 'ide_bisnis_detail.dart';
part 'pelatihan.dart';
part 'pelatihan_detail.dart';

abstract class Bloc {
  void init();
  void dispose();
}
