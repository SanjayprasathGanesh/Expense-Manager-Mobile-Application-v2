//
// class UserCredentials {
//   String? userName;
//   String? psw;
//
//   setUserName(String userName){
//     this.userName = userName;
//   }
//
//   setPsw(String psw){
//     this.psw = psw;
//   }
//
//   getUserName(){
//     return userName;
//   }
//
//   getPsw(){
//     return psw;
//   }
// }

class UserCredentials {
  // Private constructor
  UserCredentials._privateConstructor();

  // Single instance
  static final UserCredentials _instance =
      UserCredentials._privateConstructor();

  // Getter to access the single instance
  static UserCredentials get instance => _instance;

  // Private variables to hold userName and psw
  String _userName = '';
  String _psw = '';

  // Methods to set userName and psw
  void setUserName(String userName) {
    _userName = userName;
  }

  void setPsw(String psw) {
    _psw = psw;
  }

  // Methods to get userName and psw
  String getUserName() {
    return _userName;
  }

  String getPsw() {
    return _psw;
  }
}
