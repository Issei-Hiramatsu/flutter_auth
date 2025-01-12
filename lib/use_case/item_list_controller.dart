// // import 'dart:async';

// // import 'package:flutter_chatapp/repository/item_repository.dart';
// // import 'package:hooks_riverpod/hooks_riverpod.dart';

// // import '../domain/item_model/item_model.dart';
// // import '../extensions/custom_exception.dart';
// // import '../view/auth_and_todoPage.dart';

// // final itemListExceptionProvider = StateProvider<CustomException?>((_) => null);

// // final itemListControllerProvider = StateNotifierProvider(
// //   (ref) {
// //     final user = ref.watch(authControllerProvider.notifier).state;
// //     return ItemListController(ref, user?.uid);
// //   },
// // );
// // // final itemListControllerProvider = AsyncNotifierProvider(
// // //      ref.watch(authControllerProvider.notifier);
// // // );

// // class ItemListController extends StateNotifier {
// //   final Ref _read;
// //   final String? _userId;

// //   ItemListController(this._read, this._userId) : super(AsyncValue.loading()) {
// //     if (_userId != null) {
// //       retrieveItems();
// //     }
// //   }

// //   Future<void> retrieveItems({bool isRefreshing = false}) async {
// //     if (isRefreshing) state = AsyncValue.loading();
// //     try {
// //       final items = await _read
// //           .read(itemRepositoryProvider)
// //           .retrieveItems(userId: _userId!);
// //       if (mounted) {
// //         state = AsyncValue.data(items);
// //       }
// //     } on CustomException catch (e, st) {
// //       state = AsyncValue.error(e, st);
// //     }
// //   }

// //   Future<void> addItem({required String name, bool obtained = false}) async {
// //     try {
// //       final item = Item(name: name, obtained: obtained);
// //       final itemId = await _read
// //           .read(itemRepositoryProvider)
// //           .createItem(userId: _userId!, item: item);

// //       state.whenData((items) =>
// //           state = AsyncValue.data(items..add(item.copyWith(id: itemId))));
// //     } on CustomException catch (e, st) {
// //       state = AsyncValue.error(e, st);
// //     }
// //   }

// //   Future<void> updateItem({required Item updatedItem}) async {
// //     try {
// //       await _read
// //           .read(itemRepositoryProvider)
// //           .updateItem(userId: _userId!, item: updatedItem);

// //       state.whenData((items) {
// //         for (final item in items) {
// //           if (item.id == updatedItem.id) {
// //             updatedItem;
// //           } else {
// //             item;
// //           }
// //         }
// //       });
// //     } on CustomException catch (e) {
// //       _read.read(itemListExceptionProvider.notifier).state = e;
// //     }
// //   }

// //   Future<void> deleteItem({required String itemId}) async {
// //     try {
// //       await _read
// //           .read(itemRepositoryProvider)
// //           .deleteItem(userId: _userId!, itemId: itemId);

// //       //state((items) => state = AsyncValue.data(items));
// //       state;
// //     } on CustomException catch (e) {
// //       _read.read(itemListExceptionProvider.notifier).state = e;
// //     }
// //   }
// // }

// import 'dart:async';

// import 'package:flutter_chatapp/domain/item_model/item_model.dart';
// import 'package:flutter_chatapp/repository/item_repository.dart';
// import 'package:flutter_chatapp/use_case/item_list_controller.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../extensions/custom_exception.dart';
// import '../view/auth_and_todoPage.dart';

// final itemListExceptionProvider = StateProvider<CustomException?>((_) => null);

// final authControllerProvider = AsyncNotifierProvider<AuthController, void>(() {

//   return AuthController();
// },);

// // final authControllerProvider = AsyncNotifierProvider<AuthController, >(() {
// //   final user = ref.watch(authControllerProvider.notifier).state;
// //   //return ItemListController(ref, user?.uid);
// //
// // });
// // final itemListControllerProvider = AsyncNotifierProvider(
// //      ref.watch(authControllerProvider.notifier);
// // );

// // TODO: <List<Item>>
// // /とある関数が使えない場合　使えている箇所まで行って場所を特定する notifierとかの場合はあらかじめ指定しておかないと使えない
// // / <????> の重要性　意味について詳しくやっていきたいと思った

// class AuthController extends AsyncNotifier<List<Item>> {
//   late final user = ref.watch(authControllerProvider.notifier);
//   // final String? _userId;
// final userid = user.
//   // AuthController(this._userId);

//   @override
//   FutureOr<List<Item>> build() {
//     if (_userId != null) {
//       state = const AsyncLoading();
//       retrieveItems();
//     }
//     //非同期処理の結果を格納する
//     //FIXME: 削除対象 もしくはエラーとして変更するべき？
//     const List<Item> results = [];
//     // 結果を返す
//     return results;
//   }

//   Future<void> retrieveItems({bool isRefreshing = false}) async {
//     if (isRefreshing) state = const AsyncLoading();
//     try {
//       final items = await ref
//           .read(itemRepositoryProvider)
//           .retrieveItems(userId: _userId!);

//       //mountedの代わりの処理 値が存在しているかを確認する　ここが通らなければerrorが出る
//       if (state.hasValue) {
//         state = AsyncData(items);
//         print('debug: item has value');
//       }
//     } on CustomException catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }

//   Future<void> addItem({required String name, bool obtained = false}) async {
//     try {
//       final item = Item(name: name, obtained: obtained);
//       final itemId = await ref
//           .read(itemRepositoryProvider)
//           .createItem(userId: _userId!, item: item);
//       state.whenData(
//           (items) => state = AsyncData(items..add(item.copyWith(id: itemId))));
//     } on CustomException catch (e) {
//       ref.read(itemListExceptionProvider.notifier).state = e;
//     }
//   }

// //TODO: 用意されているコンストラクターを使用して作成した方が良さそう
// //TODO: Riverpod Document AsyncNotifier と AsyncNotfierProvider(こっちは探す)を読む
//   Future<void> updateItem({required Item updatedItem}) async {
//     try {
//       await ref
//           .read(itemRepositoryProvider)
//           .updateItem(userId: _userId!, item: updatedItem);

//       state.whenData(
//         (items) {
//           for (final item in items) {
//             if (item.id == updatedItem.id) {
//               updatedItem;
//             } else {
//               item;
//             }
//           }
//         },
//       );
//     } on CustomException catch (e) {
//       ref.read(itemListExceptionProvider.notifier).state = e;
//     }
//   }

//   Future<void> deleteItem({required String itemId}) async {
//     try {
//       await ref
//           .read(itemRepositoryProvider)
//           .deleteItem(userId: _userId!, itemId: itemId);

//       state.whenData((items) => state =
//           AsyncValue.data(items..removeWhere((item) => item.id == itemId)));
//     } on CustomException catch (e) {
//       ref.read(itemListExceptionProvider.notifier).state = e;
//     }
//   }
// }

import 'dart:async';

import 'package:flutter_chatapp/domain/item_model/item_model.dart';
import 'package:flutter_chatapp/repository/item_repository.dart';
import 'package:flutter_chatapp/use_case/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../extensions/custom_exception.dart';

// TODO: <List<Item>>
// /とある関数が使えない場合　使えている箇所まで行って場所を特定する notifierとかの場合はあらかじめ指定しておかないと使えない
// / <????> の重要性　意味について詳しくやっていきたいと思った
final itemListExceptionProvider = StateProvider<CustomException?>((_) => null);

final itemListControllerProvider =
    AsyncNotifierProvider<ItemListController, List<Item>>(() {
  return ItemListController();
});

class ItemListController extends AsyncNotifier<List<Item>> {
  late final userId = ref.watch(authControllerProvider);
  late final String? _userId = userId?.uid;

  @override
  FutureOr<List<Item>> build() {
    if (_userId != null) {
      state = const AsyncLoading();
      retrieveItems();
    }
    //非同期処理の結果を格納する
    //FIXME: 削除対象
    List<Item> results = [];
    // 結果を返す
    return results;
  }

  Future<void> retrieveItems({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncLoading();
    try {
      final items = await ref
          .read(itemRepositoryProvider)
          .retrieveItems(userId: _userId!);

      //mountedの代わりの処理 値が存在しているかを確認する　ここが通らなければerrorが出る
      if (state.hasValue) {
        state = AsyncData(items);
        print('debug: item has value');
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addItem({required String name, bool obtained = false}) async {
    try {
      final item = Item(name: name, obtained: obtained);
      final itemId = await ref
          .read(itemRepositoryProvider)
          .createItem(userId: _userId!, item: item);
      state.whenData(
          (items) => state = AsyncData(items..add(item.copyWith(id: itemId))));
    } on CustomException catch (e) {
      ref.read(itemListExceptionProvider.notifier).state = e;
    }
  }

  Future<void> updateItem({required Item updatedItem}) async {
    try {
      await ref
          .read(itemRepositoryProvider)
          .updateItem(userId: _userId!, item: updatedItem);

      state.whenData(
        (items) {
          for (final item in items) {
            if (item.id == updatedItem.id) {
              updatedItem;
            } else {
              item;
            }
          }
        },
      );
    } on CustomException catch (e) {
      ref.read(itemListExceptionProvider.notifier).state = e;
    }
  }

  Future<void> deleteItem({required String itemId}) async {
    try {
      await ref
          .read(itemRepositoryProvider)
          .deleteItem(userId: _userId!, itemId: itemId);

      state.whenData((items) => state =
          AsyncValue.data(items..removeWhere((item) => item.id == itemId)));
    } on CustomException catch (e) {
      ref.read(itemListExceptionProvider.notifier).state = e;
    }
  }
}
