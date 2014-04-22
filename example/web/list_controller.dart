part of angular.pagination.example;

@Controller(
    selector: "[list-ctrl]",
    publishAs: "ctrl"
    )
class ListController {
  final Scope scope;

  final List<Item> items = [];

  Paginator paginator = new Paginator.empty();

  ListController(this.scope) {
    _fillItems();
    paginator.itemsTotal = items.length;
  }

  _fillItems() {
    math.Random rnd = new math.Random();
    items.addAll(new List.generate(100, (index) => new Item(index + 1, _randomString(rnd))));
  }

  String _randomString(math.Random rnd, {min : 3, max : 10}) {
    int length = rnd.nextInt(max - min) + min;
    List<int> chars = new List.generate(length, (_) => rnd.nextInt(26) + 97);
    return new String.fromCharCodes(chars);
  }
}