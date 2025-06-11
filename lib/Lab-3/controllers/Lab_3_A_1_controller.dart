import 'package:advance_flutter_lab/Lab-3/models/Lab_3_A_1_model.dart';

class PersonCRUDController {
  List<Person> _persons = [];

  List<Person> get persons => _persons;

  void addPersonInList(Person person) {
    _persons.add(person);
  }

  void deletePersonFromList(Person person) {
    int index = _persons.indexWhere((element) => element == person);
    _persons.removeAt(index);
  }

  void editPersonInList(Person person, Person newPerson) {
    int index = _persons.indexWhere((element) => element == person);
    _persons[index] = newPerson;
  }

  bool isPersonsListEmpty() {
    return _persons.isEmpty;
  }
}
