part of 'user_bloc.dart';
//1
//Obs: O Equatable serve para comparar objetos e mudanças de estados
abstract class UserState extends Equatable{
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState{}

class UserLoogerIn extends UserState{
  final String userId;
  final String userName;

  const UserLoogerIn(this.userId, this.userName);

  @override
  List<Object> get props => [userId,userName];

}

//
class UserErrorIn extends UserState{
  final  dynamic error;
  const UserErrorIn(this.error);
}