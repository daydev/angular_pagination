part of angular.pagination.example;

@NgController(
    selector: "[list-ctrl]",
    publishAs: "ctrl"
    )

class ListController implements NgAttachAware {
  final Scope scope;

  final Paginator paginator = new Paginator.empty();

  final List<Item> items = [];

  ListController(this.scope) {
    _fillItems();
  }

  attach() {
    scope.$watch(() => items.length, (newSize) {
      paginator.itemsTotal = newSize;
    });
  }

  _fillItems() {
    Random rnd = new math.Random();
    items.addAll(new List.generate(100, (index) => new Item(index + 1, _randomString(rnd))));
  }

  String _randomString(math.Random rnd, {min : 3, max : 10}) {
    int lenght = rnd.nextInt(max - min) + min;
    List<int> chars = new List.generate(lenght, (_) => rnd.nextInt(26) + 97);
    return new String.fromCharCodes(chars);
  }
}

class Item {
  final int number;

  final String name;

  Item(this.number, this.name);
}