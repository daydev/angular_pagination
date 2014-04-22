part of angular.pagination.formatter;

/**
 * Returns single "page" from input list
 * Page number and page size are provided by second input, `Paginator` object.
 *
 * Example:
 *
 *    <span ng-repeat="item in items | pagination:paginator">{{item}}</span>
 *
 * If used as part of formatter chain, this formatter should be placed last, unless you have very specific reason not to.
 *     item in items | filter:... | orderBy:... | pagination:...
 *
 * New `List` is always returned even if all items from the input list fit on a single page.
 *
 * All edge and illegal cases are handled inside `Paginator` so the formatter itself doesn't have to.
 */

@Formatter(name:'pagination')
class PaginationFormatter {
  List call(List items, Paginator paginator) {
    paginator.itemsTotal = items != null ? items.length : 0;
    if (items != null) {
      return items.sublist(math.max(paginator.currentFirst - 1, 0), paginator.currentLast);
    } else {
      return [];
    }
  }

}