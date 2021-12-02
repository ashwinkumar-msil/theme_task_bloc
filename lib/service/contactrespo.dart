import 'package:theme_task/model/contact_data_model.dart';
import 'package:theme_task/service/network.dart';
import 'package:theme_task/src/string.dart';

class ContactService {
  Future<List<Contact>> fetchContact() async {
    ApiNetwork network = ApiNetwork();
    final response = await network.get(Strings.contactUrl);
    var contactdata = contactFromJson(response);
    return contactdata;
  }
}
