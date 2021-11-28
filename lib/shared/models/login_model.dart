class LoginModel {
  String? name;
  String? mail;
  String? phone;
  String? password;
  bool? keepOn = true;

  LoginModel({this.name, this.mail, this.phone, this.password, this.keepOn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mail = json['mail'];
    phone = json['phone'];
    password = json['password'];
    keepOn = json['keepOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['mail'] = mail;
    data['phone'] = phone;
    data['password'] = password;
    data['keepOn'] = keepOn;
    return data;
  }



@override
  String toString() {
      return "Name: " + name! + "\nE-mail: " + mail! + "\nTelefone: " + phone! + "\nSenha: " +
          password!;
    }
}


