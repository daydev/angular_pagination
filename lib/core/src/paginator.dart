part of angular.pagination.core;

/**
 * Utility class that handles page transitions dealing with edge and illegal cases
 * (e.g. trying to go on previous page of the first page, etc.)
 */
class Paginator {
  static const DEFAULT_PAGE_SIZE = 20;

  int _pageNum = 1;

  int get pageNum {
    if (_pageNum < 1) {
      _pageNum = 1;
    } else if (_pageNum > maxPage) {
      _pageNum = maxPage;
    }
    return _pageNum;
  }

  void set pageNum(int _pageNum) {
    this._pageNum = _pageNum;
  }

  int pageSize;

  int itemsTotal;

  Paginator(this.itemsTotal, [this.pageSize = DEFAULT_PAGE_SIZE]);

  Paginator.empty() : this(0);

  int get maxPage => math.max((itemsTotal / pageSize).ceil(), 1);

  int get currentFirst => math.min(pageSize * (pageNum - 1) + 1, itemsTotal);

  int get currentLast => math.min(pageSize * pageNum, itemsTotal);

  bool get isFirstPage => pageNum == 1;

  bool get isLastPage => pageNum == maxPage;

  bool get isEdge => isFirstPage || isLastPage;

  void goNext() {
    pageNum += 1;
  }

  void goPrev() {
    pageNum -= 1;
  }

  void goFirst() {
    pageNum = 1;
  }

  void goLast() {
    pageNum = maxPage;
  }

  String toString() {
    return "PagingInfo(pageNum: $pageNum, pageSize: $pageSize, items: $itemsTotal)";
  }
}
