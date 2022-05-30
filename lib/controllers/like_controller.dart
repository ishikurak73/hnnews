import 'package:hnnews/constants/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikeController {
  final box = GetStorage();
  final _ids = <int>[].obs;

  Future<void> getLikesFromStrorage() async {
    _ids.value = box.read(likeStories) ?? [];
  }

  bool has(int id) {
    return _ids.contains(id);
  }

  List<int> add(int id) {
    if (has(id) == false) {
      _ids.add(id);
      box.write(likeStories, _ids);
    }
    return _ids;
  }

  List<int> remove(int id) {
    if (has(id) == true) {
      _ids.remove(id);

      box.write(likeStories, _ids);
    }
    return _ids;
  }

  List<int> toggle(int id) {
    return has(id) ? remove(id) : add(id);
  }

  get idss => _ids;

// @override
// void dispose() {
//   // TODO: implement dispose
//   box.write(likeStories, ids);

//   super.dispose();
// }
}

final likeProvider = AutoDisposeProvider(
        (ref) => LikeController());