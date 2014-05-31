part of angular.pagination.example.pager;

@Component(
    selector: "ngx-example-pager",
    templateUrl: "packages/angular_pagination_example/example_pager/example_pager.html",
    publishAs: "m"
    )
class NgxExamplePager {
  @NgTwoWay("paginator")
  Paginator paginator;
}