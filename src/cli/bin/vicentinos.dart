import 'dart:io';

class MenuItem {
  String name = '';
  Function action = (Function? fn) {};

  MenuItem(this.name, this.action);
}

class Person {
  String id = '';
  String name = '';

  Person(this.id, this.name);
}

List<Person> people = [
  Person('A', 'name A'),
  Person('B', 'name B'),
  Person('C', 'name C'),
];

void main() {
  showMenu('main menu', [
    MenuItem('people', (Function end_people) {
      showMenu('people menu', [
        for (var person in people)
          MenuItem(person.name, (Function end_person) {
            showMenu(person.name + ' menu', [
              MenuItem('edit', (Function end_edit) {
                print('edit name of ' + person.name);
                person.name = stdin.readLineSync()!;
                end_edit(op_: 0);
              }),
              MenuItem('delete', (Function end_delete) {
                print('delete ' + person.name);
                people.remove(person);
                end_delete(op_: 0);
              }),
            ]);
            end_person();
          })
      ]);
      end_people();
    }),
    MenuItem('houses', (Function end_houses) {
      showMenu('houses menu', []);
      end_houses();
    }),
    MenuItem('events', (Function end_events) {
      showMenu('events menu', []);
      end_events();
    }),
  ]);
}

int readOption({String name = 'option'}) {
  stdout.write(name + ': ');
  var op = stdin.readLineSync() ?? '-1';
  if (op.length == 0) op = '-1';
  return int.parse(op);
}

int showMenu(String name, List<MenuItem> items) {
  items.insert(0, MenuItem('exit ' + name, () {}));

  int op = -1;

  Function invalid_option = () => op < 0 || op >= items.length;

  while (op != 0) {
    print(name + '\'s option: ${op}');

    while (invalid_option()) {
      print('');
      print(name);
      for (int i = 0; i < items.length; i++) print('${i}. ${items[i].name}');
      print('');

      op = readOption(name: name + ' option');
      if (invalid_option())
        print('invalid option');
      else if (op == 0)
        ;
      else
        items[op].action(({int op_ = -1}) {
          op = op_;
        });
    }
  }

  return op;
}
