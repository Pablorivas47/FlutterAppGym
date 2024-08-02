// validation_constants.dart

//Timer errors
const defaultDuration = Duration(milliseconds: 2500);

// General errors
const String kCompleteAllFieldsError = "Por favor complete los campos";
const String kSavingChangesError = "Error al guardar los cambios";

// Email related errors
const String kEmailNullError = "Por favor ponga su email";
const String kInvalidEmailError = "Por favor ponga un email valido";
const String kDisplayNameNullError = "Por favor ponga su email";
const String kAlreadyExistingAccount = "Ya existe una cuenta con este correo electrónico";

// Password related errors
const String kPassNullError = "Por favor ponga su contraseña";
const String kShortPassError = "Su contraseña es corta";
const String kMatchPassError = "Su contraseña no es identica";
const String kNoMatchPasswords = "Su contraseña no es identica";

// Authentication errors
const String kWrongEmailPassword = "Icorrecto email y contraseña";
const String kCreatingAccountError = "Error al crear su cuenta";

// Personal information errors
const String kNameNullError = "Por favor ponga su nombre";
const String kApellidoNullError = "Por favor ponga su apellido";
const String kPhoneNumberNullError = "Por favor ponga su numero de telefono";
const String kGenderNullError = "Por favor ponga su genero";
const String kInvalidPhoneNumberError = "Por favor ingrese un número de teléfono válido";

// Regular expressions
final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+.[a-zA-Z]+");
final RegExp websiteRegExp = RegExp(r'^((https?|ftp|smtp)://)?(www.)?[a-z0-9]+.[a-z]+(/[a-zA-Z0-9#]+/?)*$');
final RegExp instagramRegExp = RegExp(r'^(https?://)?(www.)?instagram.com/[A-Za-z0-9._%-]+/?$');
final RegExp phoneRegExp = RegExp(r'^(\+\d{1,3})?\s?\(?\d{1,4}\)?[\s.-]?\d{1,4}[\s.-]?\d{1,9}$');
final RegExp kPhoneRegExpPattern = RegExp(r'^(?:\+?54|0)?(?:11|[2368]\d)(?:(?=\d{0,2}15)\d{2})??\d{8}$');
