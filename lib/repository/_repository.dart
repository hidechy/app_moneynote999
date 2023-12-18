import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class Repository {
  Future<void> getList({required WidgetRef ref});

  Future<void> insert({required dynamic param});

  Future<void> update({required dynamic param, required WidgetRef ref});

  Future<void> delete({required dynamic param, required WidgetRef ref});
}
