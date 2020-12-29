import 'package:Relievion/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';

import 'package:validators/validators.dart';

import '../../data/repository.dart';

part 'form_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  Repository _repository;
  //   _FormStore() {
  //   _setupValidations();
  // }

  _UserStore(Repository repository) : this._repository = repository {
    _setupValidations();
  }

  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // disposers:-----------------------------------------------------------------
  List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userName, validateUserName),
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword),
      reaction((_) => userYoB, validateUserYob),
      reaction(
        (_) => userHeight,
        validateUserHeight,
      ),
      reaction(
        (_) => userWeight,
        validateUserWeight,
      )
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userName = '';

  @observable
  String userEmail = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  int userYoB;

  @observable
  String userSex;

  @observable
  double userHeight;

  @observable
  double userWeight;

  @observable
  String userHeadacheDays;

  @observable
  bool success = false;

  @observable
  String userMedication = '';

  @observable
  bool loading = false;

  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInLogin &&
      userEmail.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
      userName.isNotEmpty &&
      userEmail.isNotEmpty &&
      password.isNotEmpty;
  // confirmPasswsord.isNotEmpty;

  @computed
  bool get isYobSet =>
      !formErrorStore.hasErrorInYearSelection && userYoB != null;

  @computed
  bool get isSexSet =>
      !formErrorStore.hasErrorInSexSelection && userSex != null;

  @computed
  bool get isHeightSet =>
      !formErrorStore.hasErrorInHeightSelection && userHeight != null;

  @computed
  bool get isWeightSet =>
      !formErrorStore.hasErrorInWeightSelection && userWeight != null;

  @computed
  bool get canForgetPassword =>
      !formErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserName(String value) {
    userName = value;
  }

  @action
  void setUserId(String value) {
    userEmail = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void setUserYob(int value) {
    userYoB = value;
  }

  @action
  void setUserSex(String value) {
    userSex = value;
  }

  @action
  void setUserHeight(double value) {
    userHeight = value;
  }

  @action
  void setUserWeight(double value) {
    userWeight = value;
  }

  @action
  void setUserHeadacheDays(String value) {
    userHeadacheDays = value;
  }

  @action
  void setUsermedication(String value) {
    userMedication = value;
  }

  @action
  void validateUserName(String value) {
    if (value.isEmpty) {
      formErrorStore.userName = "Name can't be empty";
    } else if (value.length < 3) {
      formErrorStore.userName = 'Name must be at least 3 characters long';
    } else {
      formErrorStore.userName = null;
    }
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.userEmail = 'Please enter a valid email address';
    } else {
      formErrorStore.userEmail = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (value.length < 6) {
      formErrorStore.password = "Password must be at-least 6 characters long";
    } else {
      formErrorStore.password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      formErrorStore.confirmPassword = "Password doen't match";
    } else {
      formErrorStore.confirmPassword = null;
    }
  }

  @action
  void validateUserYob(int value) {
    var date = new DateTime.now().toString();

    var year = DateTime.parse(date).year;
    // print('year: ' + year.toString());
    // print('value: ' + value.toString());
    var isInt = value is int;
    if (!isInt || value > year || value < 1900) {
      formErrorStore.userYob = "Please set a valid year";
    } else {
      formErrorStore.userYob = null;
    }
  }

  @action
  void validateUserHeight(double value) {
    var compare1 = value.compareTo(2.3);
    var compare2 = value.compareTo(1.3);
    if (compare1 == 1 || compare2 == -1) {
      print('hell1111o');
      formErrorStore.userHeight = "Please set a valid height";
    } else {
      print('hello');
      formErrorStore.userHeight = null;
    }
  }

  @action
  void validateUserWeight(double value) {
    var compare1 = value.compareTo(500);
    var compare2 = value.compareTo(30);
    if (compare1 == 1 || compare2 == -1) {
      formErrorStore.userWeight = "Please set a valid weight";
    } else {
      formErrorStore.userWeight = null;
    }
  }

  @action
  Future register() async {
    loading = true;

    Future.delayed(Duration(milliseconds: 1000)).then((future) {
      loading = false;
      success = true;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });
  }

  @action
  Future login() async {
    loading = true;

    Future.delayed(Duration(milliseconds: 2000)).then((future) {
      loading = false;
      success = true;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    loading = true;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserEmail(userEmail);
    validateUserName(userName);
    validateUserYob(userYoB);
    validateUserHeight(userHeight);
    validateUserWeight(userWeight);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String userName;

  @observable
  String userEmail;

  @observable
  String password;

  @observable
  String confirmPassword;

  @observable
  String userYob;

  @observable
  String userSex;

  @observable
  String userHeight;

  @observable
  String userWeight;

  @computed
  bool get hasErrorsInLogin =>
      userEmail != null || password != null || userName != null;

  @computed
  bool get hasErrorsInRegister =>
      userEmail != null ||
      password != null ||
      // confirmPassword != null ||
      userName != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;

  @computed
  bool get hasErrorInYearSelection => userYob != null;

  @computed
  bool get hasErrorInSexSelection => userSex != null;

  @computed
  bool get hasErrorInHeightSelection => userHeight != null;

  @computed
  bool get hasErrorInWeightSelection => userWeight != null;
}
