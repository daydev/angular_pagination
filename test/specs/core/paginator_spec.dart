part of angular.pagination.test;

testPaginator() {
  Paginator pinfo;

  group("[Paginator]", () {
    setUp(() {
      pinfo = new Paginator(100);
    });

    test("initial pageNum should be 1; pageSize should equal to default if not provided", () {
      expect(pinfo.pageNum, 1);
      expect(pinfo.pageSize, Paginator.DEFAULT_PAGE_SIZE);
    });

    test("empty() constructor should create Paginator with itemsTotal = 0", () {
      pinfo = new Paginator.empty();
      expect(pinfo.itemsTotal, 0);
      expect(pinfo.pageNum, 1);
      expect(pinfo.pageSize, Paginator.DEFAULT_PAGE_SIZE);
    });

    test("maxPage should return number of maximum possible page", () {
      expect(pinfo.maxPage, 5);
      pinfo = new Paginator(101);
      expect(pinfo.maxPage, 6);
    });

    test("if there's no items maxPage should return 1", () {
      pinfo = new Paginator(0);
      expect(pinfo.maxPage, 1);
    }) ;

    test("currentFirst should return 1-based index of the first item on the page", () {
      expect(pinfo.currentFirst, 1);
      pinfo.pageNum = 4;
      pinfo.pageSize = 21;
      expect(pinfo.currentFirst, 64);
    });

    test("currentFirst should return 0 if there's no items", () {
      pinfo = new Paginator(0);
      expect(pinfo.currentFirst, 0);
    });

    test("currentLast should return 1-based index of the last item on the page", () {
      expect(pinfo.currentLast, 20);
      pinfo.pageNum = 4;
      pinfo.pageSize = 21;
      pinfo.itemsTotal = 70;
      expect(pinfo.currentLast, 70);
    });

    test("should go to the first page", () {
      pinfo.pageNum = 3;
      expect(pinfo.pageNum, 3);
      pinfo.goFirst();
      expect(pinfo.pageNum, 1);
    });

    test("should go to the last page", () {
      expect(pinfo.pageNum, 1);
      pinfo.goLast();
      expect(pinfo.pageNum, 5);
    });

    test("shold tell if on the first page", () {
      expect(pinfo.isFirstPage, true);
      pinfo.pageNum = 3;
      expect(pinfo.isFirstPage, false);
      pinfo.goFirst();
      expect(pinfo.isFirstPage, true);
    });

    test("shold tell if on the last page", () {
      expect(pinfo.isLastPage, false);
      pinfo.goLast();
      expect(pinfo.isLastPage, true);
      pinfo.pageNum = 3;
      expect(pinfo.isLastPage, false);
    });

    test("shold tell if on one of the edge positions", () {
      expect(pinfo.isEdge, true);
      pinfo.pageNum = 3;
      expect(pinfo.isEdge, false);
      pinfo.goLast();
      expect(pinfo.isEdge, true);
      pinfo.pageNum = 4;
      expect(pinfo.isEdge, false);

    });

    test("nextPage should increment pageNum", () {
      pinfo.goNext();
      expect(pinfo.pageNum, 2);
    });

    test("nextPage should not increment pageNum if next value is greater than maxPage", () {
      pinfo.pageNum = 5;
      pinfo.goNext();
      expect(pinfo.pageNum, 5);
    });

    test("prevPage should decrement pageNum", () {
      pinfo.pageNum = 5;
      pinfo.goPrev();
      expect(pinfo.pageNum, 4);
    });

    test("prevPage should not decrement pageNum if next value is less than 1", () {
      pinfo.goPrev();
      expect(pinfo.pageNum, 1);
    });

    test("pageNum should not become 0 or negative", () {
      pinfo.pageNum = 0;
      expect(pinfo.pageNum, 1);
      pinfo.pageNum = -1;
      expect(pinfo.pageNum, 1);
    });

    test("pageNum should not become greater than max page", () {
      pinfo.pageNum = 6;
      expect(pinfo.pageNum, 5);
    });

    test("pageNum should adjust if itemsTotal changed and pageNum became out of bounds", () {
      pinfo.pageNum = 5;
      pinfo.itemsTotal = 50;
      expect(pinfo.pageNum, 3);
    });

    test("pageNum should adjust if pageSize changed and pageNum became out of bounds", () {
      pinfo.pageNum = 5;
      pinfo.pageSize = 40;
      expect(pinfo.pageNum, 3);
    });

  });
}