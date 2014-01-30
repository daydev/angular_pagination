part of angular.pagination.example;

@NgComponent(
    selector: "ng-pagination-example-pager",
    templateUrl: "ng_pagination_example_pager.html",
    publishAs: "m"
    )
class NgPaginationExamplePager {
  @NgTwoWay("paginator")
  Paginator paginator;

}