import 'package:equatable/equatable.dart';

import 'package:theme_task/model/contact_data_model.dart';
import 'package:theme_task/service/contactrespo.dart';
import 'watchlist_event.dart';
import 'package:bloc/bloc.dart';

part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  ContactService contactRepo;
  late List<Contact> data;

  WatchlistBloc(this.contactRepo) : super(WatchlistInitial()) {
    on<WatchlistEvent>((event, emit) async {
      if (event is FetchContactData) {
        emit(Contactblocloading());
        try {
          data = await contactRepo.fetchContact();

          emit(ContactFetchData(contacts: data));
        } catch (exception) {
          emit(ContactError(msg: exception.toString()));
        }
      }
    });
  }
}
