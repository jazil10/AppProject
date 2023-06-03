import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishListBloc extends Bloc<WishlistEvent, WishlistState> {
  WishListBloc() : super(WishlistLoading()) {
    on<WishlistEvent>((event, emit) {});

    on<StartWishlist>((event, emit) async {
      emit(WishlistLoading());
      try {
        await Future.delayed(const Duration(seconds: 1));
        emit(const WishlistLoaded());
      } catch (_) {}
    });

    on<AddWishListProduct>((event, Emitter<WishlistState> emit) {
      final state = this.state;
      if (state is WishlistLoaded) {
        try {
          emit(WishlistLoaded(
              wishlist: Wishlist(
                  products: List.from(state.wishlist.products)
                    ..add(event.product))));
        } catch (_) {}
      }
    });

    on<RemoveWishListProduct>((event, Emitter<WishlistState> emit) {
      final state = this.state;
      if (state is WishlistLoaded) {
        try {
          emit(WishlistLoaded(
              wishlist: Wishlist(
                  products: List.from(state.wishlist.products)
                    ..remove(event.product))));
        } catch (_) {}
      }
    });
  }
}
