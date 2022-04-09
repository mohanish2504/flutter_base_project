part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  UserInitial();
  @override
  List<Object> get props => [];
}

class FetchedUsers extends UserState {
  final List<User> users;
  FetchedUsers(this.users);
  @override
  List<Object> get props => [users];
}


