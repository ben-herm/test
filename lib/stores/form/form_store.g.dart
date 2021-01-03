// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<bool> _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: '_UserStore.canLogin'))
      .value;
  Computed<bool> _$canRegisterComputed;

  @override
  bool get canRegister =>
      (_$canRegisterComputed ??= Computed<bool>(() => super.canRegister,
              name: '_UserStore.canRegister'))
          .value;
  Computed<bool> _$isYobSetComputed;

  @override
  bool get isYobSet => (_$isYobSetComputed ??=
          Computed<bool>(() => super.isYobSet, name: '_UserStore.isYobSet'))
      .value;
  Computed<bool> _$isSexSetComputed;

  @override
  bool get isSexSet => (_$isSexSetComputed ??=
          Computed<bool>(() => super.isSexSet, name: '_UserStore.isSexSet'))
      .value;
  Computed<bool> _$isHeightSetComputed;

  @override
  bool get isHeightSet =>
      (_$isHeightSetComputed ??= Computed<bool>(() => super.isHeightSet,
              name: '_UserStore.isHeightSet'))
          .value;
  Computed<bool> _$isWeightSetComputed;

  @override
  bool get isWeightSet =>
      (_$isWeightSetComputed ??= Computed<bool>(() => super.isWeightSet,
              name: '_UserStore.isWeightSet'))
          .value;
  Computed<bool> _$canForgetPasswordComputed;

  @override
  bool get canForgetPassword => (_$canForgetPasswordComputed ??= Computed<bool>(
          () => super.canForgetPassword,
          name: '_UserStore.canForgetPassword'))
      .value;
  Computed<bool> _$isHeadacheDaysSetComputed;

  @override
  bool get isHeadacheDaysSet => (_$isHeadacheDaysSetComputed ??= Computed<bool>(
          () => super.isHeadacheDaysSet,
          name: '_UserStore.isHeadacheDaysSet'))
      .value;
  Computed<bool> _$isMedicationsSetComputed;

  @override
  bool get isMedicationsSet => (_$isMedicationsSetComputed ??= Computed<bool>(
          () => super.isMedicationsSet,
          name: '_UserStore.isMedicationsSet'))
      .value;

  final _$userNameAtom = Atom(name: '_UserStore.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$userEmailAtom = Atom(name: '_UserStore.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$passwordAtom = Atom(name: '_UserStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_UserStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$userYoBAtom = Atom(name: '_UserStore.userYoB');

  @override
  int get userYoB {
    _$userYoBAtom.reportRead();
    return super.userYoB;
  }

  @override
  set userYoB(int value) {
    _$userYoBAtom.reportWrite(value, super.userYoB, () {
      super.userYoB = value;
    });
  }

  final _$userSexAtom = Atom(name: '_UserStore.userSex');

  @override
  String get userSex {
    _$userSexAtom.reportRead();
    return super.userSex;
  }

  @override
  set userSex(String value) {
    _$userSexAtom.reportWrite(value, super.userSex, () {
      super.userSex = value;
    });
  }

  final _$userHeightAtom = Atom(name: '_UserStore.userHeight');

  @override
  int get userHeight {
    _$userHeightAtom.reportRead();
    return super.userHeight;
  }

  @override
  set userHeight(int value) {
    _$userHeightAtom.reportWrite(value, super.userHeight, () {
      super.userHeight = value;
    });
  }

  final _$userWeightAtom = Atom(name: '_UserStore.userWeight');

  @override
  double get userWeight {
    _$userWeightAtom.reportRead();
    return super.userWeight;
  }

  @override
  set userWeight(double value) {
    _$userWeightAtom.reportWrite(value, super.userWeight, () {
      super.userWeight = value;
    });
  }

  final _$userHeadacheDaysAtom = Atom(name: '_UserStore.userHeadacheDays');

  @override
  String get userHeadacheDays {
    _$userHeadacheDaysAtom.reportRead();
    return super.userHeadacheDays;
  }

  @override
  set userHeadacheDays(String value) {
    _$userHeadacheDaysAtom.reportWrite(value, super.userHeadacheDays, () {
      super.userHeadacheDays = value;
    });
  }

  final _$userMedicationsAtom = Atom(name: '_UserStore.userMedications');

  @override
  Map<String, Map<dynamic, dynamic>> get userMedications {
    _$userMedicationsAtom.reportRead();
    return super.userMedications;
  }

  @override
  set userMedications(Map<String, Map<dynamic, dynamic>> value) {
    _$userMedicationsAtom.reportWrite(value, super.userMedications, () {
      super.userMedications = value;
    });
  }

  final _$successAtom = Atom(name: '_UserStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$loadingAtom = Atom(name: '_UserStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('_UserStore.register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$loginAsyncAction = AsyncAction('_UserStore.login');

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$forgotPasswordAsyncAction = AsyncAction('_UserStore.forgotPassword');

  @override
  Future<dynamic> forgotPassword() {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword());
  }

  final _$logoutAsyncAction = AsyncAction('_UserStore.logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void setUserName(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetRegistration() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.resetRegistration');
    try {
      return super.resetRegistration();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetErrors() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.resetErrors');
    try {
      return super.resetErrors();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserId(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserYob(int value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setUserYob');
    try {
      return super.setUserYob(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserSex(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setUserSex');
    try {
      return super.setUserSex(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserHeight(int value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUserHeight');
    try {
      return super.setUserHeight(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserWeight(double value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUserWeight');
    try {
      return super.setUserWeight(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserHeadacheDays(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUserHeadacheDays');
    try {
      return super.setUserHeadacheDays(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsermedications(Map<String, Map<dynamic, dynamic>> value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUsermedications');
    try {
      return super.setUsermedications(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserName(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validateUserName');
    try {
      return super.validateUserName(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value, [int minLength = 8]) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validatePassword');
    try {
      return super.validatePassword(value, minLength);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserYob(int value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validateUserYob');
    try {
      return super.validateUserYob(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserHeight(int value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validateUserHeight');
    try {
      return super.validateUserHeight(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserWeight(double value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validateUserWeight');
    try {
      return super.validateUserWeight(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
userEmail: ${userEmail},
password: ${password},
confirmPassword: ${confirmPassword},
userYoB: ${userYoB},
userSex: ${userSex},
userHeight: ${userHeight},
userWeight: ${userWeight},
userHeadacheDays: ${userHeadacheDays},
userMedications: ${userMedications},
success: ${success},
loading: ${loading},
canLogin: ${canLogin},
canRegister: ${canRegister},
isYobSet: ${isYobSet},
isSexSet: ${isSexSet},
isHeightSet: ${isHeightSet},
isWeightSet: ${isWeightSet},
canForgetPassword: ${canForgetPassword},
isHeadacheDaysSet: ${isHeadacheDaysSet},
isMedicationsSet: ${isMedicationsSet}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool> _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??= Computed<bool>(
          () => super.hasErrorsInLogin,
          name: '_FormErrorStore.hasErrorsInLogin'))
      .value;
  Computed<bool> _$hasErrorsInRegisterComputed;

  @override
  bool get hasErrorsInRegister => (_$hasErrorsInRegisterComputed ??=
          Computed<bool>(() => super.hasErrorsInRegister,
              name: '_FormErrorStore.hasErrorsInRegister'))
      .value;
  Computed<bool> _$hasErrorInForgotPasswordComputed;

  @override
  bool get hasErrorInForgotPassword => (_$hasErrorInForgotPasswordComputed ??=
          Computed<bool>(() => super.hasErrorInForgotPassword,
              name: '_FormErrorStore.hasErrorInForgotPassword'))
      .value;
  Computed<bool> _$hasErrorInHeadacheSelectionComputed;

  @override
  bool get hasErrorInHeadacheSelection =>
      (_$hasErrorInHeadacheSelectionComputed ??= Computed<bool>(
              () => super.hasErrorInHeadacheSelection,
              name: '_FormErrorStore.hasErrorInHeadacheSelection'))
          .value;
  Computed<bool> _$hasErrorInMedicationsSelectionComputed;

  @override
  bool get hasErrorInMedicationsSelection =>
      (_$hasErrorInMedicationsSelectionComputed ??= Computed<bool>(
              () => super.hasErrorInMedicationsSelection,
              name: '_FormErrorStore.hasErrorInMedicationsSelection'))
          .value;
  Computed<bool> _$hasErrorInYearSelectionComputed;

  @override
  bool get hasErrorInYearSelection => (_$hasErrorInYearSelectionComputed ??=
          Computed<bool>(() => super.hasErrorInYearSelection,
              name: '_FormErrorStore.hasErrorInYearSelection'))
      .value;
  Computed<bool> _$hasErrorInSexSelectionComputed;

  @override
  bool get hasErrorInSexSelection => (_$hasErrorInSexSelectionComputed ??=
          Computed<bool>(() => super.hasErrorInSexSelection,
              name: '_FormErrorStore.hasErrorInSexSelection'))
      .value;
  Computed<bool> _$hasErrorInHeightSelectionComputed;

  @override
  bool get hasErrorInHeightSelection => (_$hasErrorInHeightSelectionComputed ??=
          Computed<bool>(() => super.hasErrorInHeightSelection,
              name: '_FormErrorStore.hasErrorInHeightSelection'))
      .value;
  Computed<bool> _$hasErrorInWeightSelectionComputed;

  @override
  bool get hasErrorInWeightSelection => (_$hasErrorInWeightSelectionComputed ??=
          Computed<bool>(() => super.hasErrorInWeightSelection,
              name: '_FormErrorStore.hasErrorInWeightSelection'))
      .value;

  final _$userNameAtom = Atom(name: '_FormErrorStore.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$userEmailAtom = Atom(name: '_FormErrorStore.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$passwordAtom = Atom(name: '_FormErrorStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_FormErrorStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$userHeadacheDaysAtom = Atom(name: '_FormErrorStore.userHeadacheDays');

  @override
  String get userHeadacheDays {
    _$userHeadacheDaysAtom.reportRead();
    return super.userHeadacheDays;
  }

  @override
  set userHeadacheDays(String value) {
    _$userHeadacheDaysAtom.reportWrite(value, super.userHeadacheDays, () {
      super.userHeadacheDays = value;
    });
  }

  final _$userYobAtom = Atom(name: '_FormErrorStore.userYob');

  @override
  String get userYob {
    _$userYobAtom.reportRead();
    return super.userYob;
  }

  @override
  set userYob(String value) {
    _$userYobAtom.reportWrite(value, super.userYob, () {
      super.userYob = value;
    });
  }

  final _$userMedicationsAtom = Atom(name: '_FormErrorStore.userMedications');

  @override
  String get userMedications {
    _$userMedicationsAtom.reportRead();
    return super.userMedications;
  }

  @override
  set userMedications(String value) {
    _$userMedicationsAtom.reportWrite(value, super.userMedications, () {
      super.userMedications = value;
    });
  }

  final _$userSexAtom = Atom(name: '_FormErrorStore.userSex');

  @override
  String get userSex {
    _$userSexAtom.reportRead();
    return super.userSex;
  }

  @override
  set userSex(String value) {
    _$userSexAtom.reportWrite(value, super.userSex, () {
      super.userSex = value;
    });
  }

  final _$userHeightAtom = Atom(name: '_FormErrorStore.userHeight');

  @override
  String get userHeight {
    _$userHeightAtom.reportRead();
    return super.userHeight;
  }

  @override
  set userHeight(String value) {
    _$userHeightAtom.reportWrite(value, super.userHeight, () {
      super.userHeight = value;
    });
  }

  final _$userWeightAtom = Atom(name: '_FormErrorStore.userWeight');

  @override
  String get userWeight {
    _$userWeightAtom.reportRead();
    return super.userWeight;
  }

  @override
  set userWeight(String value) {
    _$userWeightAtom.reportWrite(value, super.userWeight, () {
      super.userWeight = value;
    });
  }

  @override
  String toString() {
    return '''
userName: ${userName},
userEmail: ${userEmail},
password: ${password},
confirmPassword: ${confirmPassword},
userHeadacheDays: ${userHeadacheDays},
userYob: ${userYob},
userMedications: ${userMedications},
userSex: ${userSex},
userHeight: ${userHeight},
userWeight: ${userWeight},
hasErrorsInLogin: ${hasErrorsInLogin},
hasErrorsInRegister: ${hasErrorsInRegister},
hasErrorInForgotPassword: ${hasErrorInForgotPassword},
hasErrorInHeadacheSelection: ${hasErrorInHeadacheSelection},
hasErrorInMedicationsSelection: ${hasErrorInMedicationsSelection},
hasErrorInYearSelection: ${hasErrorInYearSelection},
hasErrorInSexSelection: ${hasErrorInSexSelection},
hasErrorInHeightSelection: ${hasErrorInHeightSelection},
hasErrorInWeightSelection: ${hasErrorInWeightSelection}
    ''';
  }
}
