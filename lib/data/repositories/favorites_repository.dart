import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furniture_shop_app/data/firebase/firebase.dart';
import 'package:furniture_shop_app/data/api/api.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:talker/talker.dart';

class FavoritesRepository implements IFavoritesRepository {
  FavoritesRepository({
    required this.authClient,
    required this.firestoreClient,
    required this.dioClient,
  }) {
    locator<Talker>().debug('INITIALIZED FAV REPO');
    _favoritesStreamController = StreamController<ProductPvList>.broadcast()
      ..addStream(_streamProducts());

    _lastEventSub =
        _favoritesStreamController.stream.listen((event) => _lastEvent = event);
  }

  final AuthClient authClient;
  final FirestoreClient firestoreClient;
  final DioClient dioClient;

  late final StreamController<ProductPvList> _favoritesStreamController;
  late final StreamSubscription<ProductPvList> _lastEventSub;

  ProductPvList? _lastEvent;

  @override
  ProductPvList? get lastStreamEvent => _lastEvent;

  @override
  Stream<ProductPvList> get favoritesStream =>
      _favoritesStreamController.stream;

  @override
  Future<void> add({required String id}) async {
    try {
      await firestoreClient.addToFavorites(
        userId: authClient.getUserId,
        productId: id,
      );
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<void> addAllToCart() async {
    try {
      await firestoreClient.addAllToCart(
        userId: authClient.getUserId,
      );
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<bool> isFavorite({required String id}) async {
    try {
      final isFavorite = await firestoreClient.isFavorite(
        userId: authClient.getUserId,
        productId: id,
      );
      if (isFavorite) {
        return true;
      }
      return false;
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<void> remove({required String id}) async {
    try {
      await firestoreClient.removeFromFavorites(
        userId: authClient.getUserId,
        productId: id,
      );
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  Stream<ProductPvList> _streamProducts() => firestoreClient
          .streamFavoriteItems(userId: authClient.getUserId)
          .asyncMap((listOfIds) async {
        if (listOfIds.isEmpty) return const ProductPvList(products: []);
        final favoriteProducts =
            await dioClient.getProductsByIds(ids: listOfIds);
        return favoriteProducts;
      });

  @override
  void dispose() {
    _lastEventSub.cancel();
    _favoritesStreamController.close();
  }
}
