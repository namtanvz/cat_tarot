class Profile {
  String? email;
  String? fullname;
  String? password;
  String? birthday;

  Profile({
    this.email, 
    this.fullname, 
    this.password, 
    this.birthday
  });

  Map<String, dynamic> toJson() => {
    'email' : email,
    'fullname' : fullname,
    'password' : password,
    'birthday' : birthday
  };

  static Profile fromJson(Map<String, dynamic> json) => Profile(
    email: json['email'],
    fullname: json['fullname'],
    password: json['password'],
    birthday: json['birthday'],
  );
}
