class FizKundelikInfo {
  String? cookies;
  int? cookiesExpire;
  bool? isKundelikLogin;
  String? login;
  String? password;
  String? token;
  int? tokenExpire;

  FizKundelikInfo({
    this.cookies,
    this.cookiesExpire,
    this.isKundelikLogin,
    this.login,
    this.password,
    this.token,
    this.tokenExpire,
  });

  static FizKundelikInfo getCurrentKundelik = FizKundelikInfo(
      cookies: null,
      cookiesExpire: null,
      isKundelikLogin: false,
      login: "",
      password: "",
      token: null,
      tokenExpire: 0,
    );

}
