library angular.pagination.test.cs;

import 'package:unittest/html_config.dart';

import 'angular_pagination_spec.dart' as spec;

/*
  Special test runner to make content_shell return after running all tests and not hang
  Can't use useHtmlConfiguration() in main spec because it will make karma unhappy
 */

main() {
  useHtmlConfiguration();
  spec.main();
}
