part of angular.pagination.test;

testPaginationFilter() {
  group("[PaginationFilter]", () {
    PaginationFilter pagination;

    List<int> _fill(int size) => new List.generate(size, (i) => i + 1);

    setUp(() {
      setUpInjector();
      module((Module m) => m.install(new AngularPaginationModule()));
      inject((PaginationFilter filter) {
        pagination = filter;
      });
    });
    tearDown(tearDownInjector);

    test("should return whole list if it's smaller than page size", () {
      List items = _fill(5);
      expect(pagination(items, new Paginator(items.length)), hasLength(5));
    });

    test("should always create new list even if all items are returned", () {
      List items = _fill(10);
      expect(identical(items, new Paginator(items.length)), false);
    });

    test("should return page specified", () {
      List items = _fill(100);
      List filtered = pagination(
          items,
          new Paginator(items.length)
            ..pageNum = 3);
      expect(filtered.first, 41);
      expect(filtered.last, 60);
    });

    test("should support custom page size", () {
      List items = _fill(100);
      List filtered = pagination(
          items,
          new Paginator(items.length, 16)
            ..pageNum = 3
          );
      expect(filtered.first, 33);
      expect(filtered.last, 48);
    });

    test("should update Paginator with length of input list", () {
      Paginator p = new Paginator.empty();
      List items = _fill(100);
      pagination(items, p);
      expect(p.itemsTotal, 100);
    });

    test("shold return empty list if input is empty", () {
      expect(pagination([], new Paginator.empty()), []);
    });

    test("should return empty list if input is null", () {
      expect(pagination(null, new Paginator.empty()), []);
    });

  });
}