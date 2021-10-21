class User {
  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phone;
  String avatar;
  String address;
  int roleId;
  String status;
  String lastLogin;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;
  Role role;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.phone,
      this.avatar,
      this.address,
      this.roleId,
      this.status,
      this.lastLogin,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    address = json['address'];
    roleId = json['role_id'];
    status = json['status'];
    lastLogin = json['last_login'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['address'] = this.address;
    data['role_id'] = this.roleId;
    data['status'] = this.status;
    data['last_login'] = this.lastLogin;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.role != null) {
      data['role'] = this.role.toJson();
    }
    return data;
  }
}

class Role {
  int id;
  String name;
  String displayName;
  String description;
  bool removable;
  String updatedAt;
  String createdAt;

  Role(
      {this.id,
      this.name,
      this.displayName,
      this.description,
      this.removable,
      this.updatedAt,
      this.createdAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['display_name'];
    description = json['description'];
    removable = json['removable'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['description'] = this.description;
    data['removable'] = this.removable;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
