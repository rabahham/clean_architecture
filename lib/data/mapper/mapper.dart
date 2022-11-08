import '../../app/constants.dart';
import '../../domain/models/models.dart';
import '../responce/responses.dart';
import 'package:clean_architecture/app/extension.dart';

extension CostomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orEmpty() ?? Constants.empty,
        this?.name.orEmpty() ?? Constants.empty,
        this?.numOFNotification.orZero() ?? Constants.zero);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.phone.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.link.orEmpty() ?? Constants.empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      // this?.customer!.toDomain(),
      // this?.contacts!.toDomain(),
      this?.customer,
      this?.contacts,
    );
  }
}
