// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';

// Monarch is always running on phones, but is uses web render under the hood
class MockCapabilities implements CapabilitiesDefinition {
  @override
  bool get shouldHaveArrowsInHorizontalLists => false;
}

Widget listRowNeedsManualRefreshToMockGetIt() {
  GetIt.I.reset();
  GetIt.I.registerSingleton<CapabilitiesDefinition>(MockCapabilities());
  return ListRow.buildWithFakeItems();
}
