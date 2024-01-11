part of 'user_bloc.dart';
//2
abstract class UserEvent extends Equatable{
  const UserEvent();

  @override
  List<Object> get props => [];

}

class UserLogin extends UserEvent{
  final String userId;
  final String userName;

  const UserLogin(this.userId, this.userName);

  @override
  List<Object> get props => [userId,userName];
}