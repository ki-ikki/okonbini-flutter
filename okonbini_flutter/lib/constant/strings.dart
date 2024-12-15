class Strings {
  static final login = _LoginStrings();
  static final register = _RegisterStrings();
}

// ログイン画面
class _LoginStrings {
  final String emailAlreadyInUse = 'このメールアドレスは既に使用されています';
  final String invalidEmail = 'メールアドレスの形式が正しくありません';
  final String wrongPassword = 'パスワードが正しくありません';
  final String unknownError = 'エラーが発生しました';

  final String registrationSuccess = 'ユーザー登録に成功しました';
  final String loginSuccess = 'ログインに成功しました';
  final String loginFailure = 'ログインに失敗しました';
  final String logoutSuccess = 'ログアウトしました';
  final String logoutFailure = 'ログアウトに失敗しました';

  final String emailLabel = 'メールアドレス';
  final String passwordLabel = 'パスワード';

  final String registerButton = '新規アカウント作成';
  final String loginButton = 'ログイン';
  final String logoutButton = 'ログアウト';

  final String forgotPassword = 'パスワードを忘れた場合';
  final String passwordResetButton = 'パスワードリセット';
  final String passwordResetMailSent = 'パスワードリセットメールを送信しました';
  final String passwordResetMailFailed = 'パスワードリセットメールの送信に失敗しました';
}

// ユーザー登録画面
class _RegisterStrings {
  final String userIdLabel = 'ユーザーID';
  final String emailInputIsEmpty = 'ユーザーIDを入力してください';
  final String userIdInputIsInvalid = '英数字と記号 (_ - @ .) のみ使用できます';
  final String userIdHint = '英数字記号で入力してください';
  final String emailLabel = 'メールアドレス';
  final String emailInputIsInvalid = 'メールアドレスの形式が正しくありません';
  final String passwordLabel = 'パスワード';
  final String passwordInputIsEmpty = 'パスワードを入力してください';
  final String passwordInputIsInvalid = '8文字以上、大文字・小文字・数字をそれぞれ1文字以上使用してください';
  final String passwordConfirmLabel = 'パスワード（確認用）';
  final String passwordConfirmInputIsEmpty = 'パスワード（確認用）を入力してください';
  final String passwordConfirmInputIsInvalid = 'パスワードが一致しません';
  final String registerButton = 'アカウント登録';
}
