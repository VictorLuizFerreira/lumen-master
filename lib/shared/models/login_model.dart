class LoginModel {
  String name = "";
  String mail = "";
  String phone = "";
  String password = "";
  bool keepOn = true;

  LoginModel({required this.name, required this.mail, required this.phone, required this.password, required this.keepOn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mail = json['mail'];
    phone = json['phone'];
    password = json['password'];
    keepOn = json['keepOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mail'] = this.mail;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['keepOn'] = this.keepOn;
    return data;
  }



String toString() {
      return "Name: " + this.name + "\nE-mail: " + this.mail + "\nTelefone: " + this.phone + "\nSenha: " +
          this.password;
    }
}


