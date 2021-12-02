part of 'watchlist_bloc.dart';

abstract class WatchlistState extends Equatable {
  const WatchlistState();
  @override
  List<Contact> get props => [];
}

class WatchlistInitial extends WatchlistState {}

class ContactblocInitial extends WatchlistState {}

class Contactblocloading extends WatchlistState {}

class ContactFetchData extends WatchlistState {
  List<Contact> contacts;
  ContactFetchData({required this.contacts});
}

class ContactError extends WatchlistState {
  String msg;
  ContactError({required this.msg});
}
