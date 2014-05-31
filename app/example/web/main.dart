library angular.pagination.example;

import 'dart:math' as math;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular_pagination/angular_pagination.dart';
import 'package:angular_pagination_example/example_pager/module.dart';

part 'item.dart';
part 'list_controller.dart';

class AngularPaginationExampleModule extends Module {
  AngularPaginationExampleModule() {
    install(new AngularPaginationModule());
    install(new ExamplePagerModule());

    type(ListController);
  }
}

main() {
  applicationFactory()
  .addModule(new AngularPaginationExampleModule())
  .run();
}