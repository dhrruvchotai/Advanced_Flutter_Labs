import 'package:advance_flutter_lab/Lab-3/models/Lab_3_A_2_model.dart';

class PersonDBController {
  DatabaseService _dbService = DatabaseService();
  List<Map<String, dynamic>> persons = [];

  void addUserInDB({required String name}) {
    _dbService.addPerson(name: name);
  }

  Future<void> fetchPersons() async {
    persons = await _dbService.fetchPersons();
  }
}
