library angular.pagination.test;

import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
import 'package:unittest/unittest.dart';

import 'package:angular_pagination/angular_pagination.dart';

part 'specs/core/paginator_spec.dart';

part 'specs/formatter/pagination_formatter_spec.dart';

main() {
  testPaginator();
  testPaginationFormatter();
}