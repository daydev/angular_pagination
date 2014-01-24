library angular.pagination.example;

import 'dart:math' as math;

import 'package:angular/angular.dart';
import 'package:angular_pagination/angular_pagination.dart';

part 'list_controller.dart';
part 'ng_pagination_example_pager.dart';

class AngularPaginationExampleModule extends Module {
  AngularPaginationExampleModule() {
    install(new AngularPaginationModule());

    type(ListController);
    type(NgPaginationExamplePager);
  }
}

main() {
  ngBootstrap(module: new AngularPaginationExampleModule());
}