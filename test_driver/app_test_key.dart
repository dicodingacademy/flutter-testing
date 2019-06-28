import 'package:flutter_driver/flutter_driver.dart';
import 'package:search_users/common/widget_key.dart';

final searchField = find.byValueKey(SEARCH_FIELD);
final searchButton = find.byValueKey(SEARCH_BUTTON);
final searchContent = find.byValueKey(SEARCH_CONTENT);

final content1 = find.byValueKey(CONTENT_KEY + "1");
final content2 = find.byValueKey(CONTENT_KEY + "2");

final detailLeading = find.byValueKey(DETAIL_LEADING);
final detailContent = find.byValueKey(DETAIL_CONTENT);
final detailImage = find.byValueKey(DETAIL_IMAGE);
