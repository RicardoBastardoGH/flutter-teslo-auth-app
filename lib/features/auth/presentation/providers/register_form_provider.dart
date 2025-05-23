

// 1. State

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop_mobile/features/shared/infraestructure/inputs/inputs.dart';

class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Name name;
  final Email email;
  final Password password;
  final Password confimPassword;

  RegisterFormState({
    this.isPosting = false, 
    this.isFormPosted = false, 
    this.isValid = false, 
    this.name = const Name.pure(), 
    this.email = const Email.pure(), 
    this.password = const Password.pure(), 
    this.confimPassword = const Password.pure()
  });

  copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Name? name,
    Email? email,
    Password? password,
    Password? confimPassword,
  }) => RegisterFormState (
    isPosting: isPosting ?? this.isPosting,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    name: name ?? this.name,
    email: email ?? this.email,
    password: password ?? this.password,
    confimPassword: confimPassword ?? this.confimPassword,
  );

  @override                  
  String toString() {
    return '''                 
      isPosting: $isPosting
      isFormPosted: $isFormPosted
      isValid: $isValid
      name: $name
      email: $email
      password: $password
      confimPassword: $confimPassword
    ''';
  }


}


// 2. notifier
class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  RegisterFormNotifier(): super(RegisterFormState());

  onNameChange( String value ){
    final newName = Name.dirty(value);
    state.copyWith(
      name: newName,
      isValid: Formz.validate([ newName, state.email, state.password, state.confimPassword ])
    );

  }
  
  
}




// 3. StateNotifier / provider



