import 'package:clean_architecture/app/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}
  
//   bvoid test() {
//   String? data = null;
//   int? count;

//   print(data.orEmpty());
// }


