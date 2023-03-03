class RegisterParameters {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterParameters(
      {required this.name,
      required this.email,
      required this.password,
      required this.confirmPassword});
}

class SignInParameters {
  final String email;
  final String password;

  SignInParameters({required this.email, required this.password});
}
