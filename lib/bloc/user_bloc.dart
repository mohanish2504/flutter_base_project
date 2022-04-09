import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  List<User> users = [];
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {
        if(event is FetchAllUsers) {
          /// logic
          emit(FetchedUsers(users));
        }
    });
  }
}
