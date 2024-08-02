import 'package:flutter_application_1/constants/errores/validation_error_messages.dart';


//Errores ForgetPassword
Map<String ,String?> forgetPasswordMap(
  Map<String ,String?> errors,
  String email,
) {
  if (email.isEmpty) {
    errors['email'] = kEmailNullError;
  } else {
    if (!emailValidatorRegExp.hasMatch(email)) {
      errors['email'] = kInvalidEmailError;
    } else{
        errors.remove('email');
      }
  }
  return errors;
}

//Errores SingIn
Map<String ,String?> signInErrorValidationMap(
  Map<String ,String?> errors,
  String email,
  String password,
  bool logged,
) {
  if (email.isEmpty) {
    errors['email'] = kEmailNullError;
  } else {
    errors.remove('email');
    if (!emailValidatorRegExp.hasMatch(email)) {
      errors['email'] = kInvalidEmailError;
    } else {
      errors.remove('email');
    }
  }
  if (password.isEmpty) {
    errors['password'] = kPassNullError;
  } else {
    errors.remove('password');
    if (password.length < 6) {
      errors['password'] = kShortPassError;
    } else {
      errors.remove('password');
    }
  }
   if (logged == false) {
       if (errors['email'] != (kEmailNullError) &&
          (errors['email'] != (kInvalidEmailError))) {
         if (errors['password'] != (kPassNullError) && 
          (errors['password'] != (kShortPassError))) {
            errors['password'] = (kWrongEmailPassword);
          }
  } else {
    errors.remove(kWrongEmailPassword);
    }
  }
  return errors;
}

//Errores SingUp
Map<String ,String?> signUpErrorValidationMap(
  Map<String ,String?> errors,
  String name,
  String nickname,
  String email,
  String gender,
  String phonenumber,
  String password,
  String confirmpassword,
) {
  if (name.isEmpty){
    errors['name'] = kNameNullError;
  } else {
   errors.remove('name');
  }

  if (nickname.isEmpty){
    errors['nickname'] = kApellidoNullError;
  } else {
    errors.remove('nickname');
  }

  if (phonenumber.isEmpty) {
    errors['phonenumber'] = kPhoneNumberNullError;
  } else if (!kPhoneRegExpPattern.hasMatch(phonenumber)) {
      errors['phonenumber'] = kInvalidPhoneNumberError;
  } else {
    errors.remove('phonenumber');
}

  if (gender.isEmpty){
    errors['gender'] = kGenderNullError;
  } else {
    errors.remove('gender');
  }

  if (email.isEmpty) {
    errors['email'] = kEmailNullError;
  } else {
    if (!emailValidatorRegExp.hasMatch(email)) {
      errors['email'] = kInvalidEmailError;
    }else{
      errors.remove('email');
    }  
  }
  if (password.isEmpty) {
    errors['password'] = kPassNullError;
  } else {
    errors.remove('password');
    if (password.length < 6) {
      errors['password'] = kShortPassError;
    } else {
      errors.remove('password');
    }
  }
  if (password != confirmpassword) {  
    errors['confirmpassword'] = kNoMatchPasswords; 
  } else {
    errors.remove('confirmpassword');
  }


  return errors;
}

Map<String ,String?> errorEmailMap(
  Map<String ,String?> errors,
  bool existEmail,
) {
  if(existEmail == false){
    errors['email'] = kAlreadyExistingAccount;
  }else{
    errors.remove('email');
  }

  return errors;
}

//Todos los errores juntos en formato lista (no esta usado)
List<String?> signUpErrorValidationList(
  List<String?> errors,
  String name,
  String nickname,
  String email,
  String gender,
  String phonenumber,
  String password,
  String confirmpassword,
  bool logged,
) {

  if (name == ''){
    errors.add(kNameNullError);
  } else {
    errors.remove(kNameNullError);
  }

  if (nickname == ''){
    errors.add(kApellidoNullError);
  } else {
    errors.remove(kApellidoNullError);
  }

  if (phonenumber == ''){
    errors.add(kPhoneNumberNullError);
  } else {
    errors.remove(kPhoneNumberNullError);
  }

  if (gender == ''){
    errors.add(kGenderNullError);
  } else {
    errors.remove(kGenderNullError);
  }

  if (email == '') {
    if (!errors.contains(kEmailNullError)) {
      errors.add(kEmailNullError);
    }
  } else {
    errors.remove(kEmailNullError);
    if (!emailValidatorRegExp.hasMatch(email)) {
      if (!errors.contains(kInvalidEmailError)) {
        errors.add(kInvalidEmailError);
      }
    } else {
      errors.remove(kInvalidEmailError);
    }
  }

  if (password == '') {
    if (!errors.contains(kPassNullError)) {
      errors.add(kPassNullError);
    }
  } else {
    errors.remove(kPassNullError);
    if (password.length < 6) {
      if (!errors.contains(kShortPassError)) {
        errors.add(kShortPassError);
      }
    } else {
      errors.remove(kShortPassError);
    }
  }

  if (logged == false) {
    if (!errors.contains(kWrongEmailPassword)) {
      if (!errors.contains(kEmailNullError) &&
          (!errors.contains(kInvalidEmailError))) {
        if (!errors.contains(kPassNullError) &&
            (!errors.contains(kShortPassError))) {
          errors.add(kWrongEmailPassword);
        }
      }
    }
  } else {
    errors.remove(kWrongEmailPassword);
  }

  if (password != confirmpassword) {
    if (!errors.contains(kNoMatchPasswords)) {       
          errors.add(kNoMatchPasswords);
        }
  } else {
    errors.remove(kNoMatchPasswords);
  }
  return errors;
}
