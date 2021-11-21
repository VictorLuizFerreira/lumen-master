class Routes {
  static const String authService =
      "https://identitytoolkit.googleapis.com/v1/";

  static const String apiKey = "AIzaSyC6bpXsXBiY4fd0RncyLK8eYNDEqQdE_aU";

  String login() {
    return authService + "accounts:signInWithPassword?key=" + apiKey;
  }

  String cadastro() {
    return authService + "accounts:signUp?key=" + apiKey;
  }
}