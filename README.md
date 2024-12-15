# okonbini-flutter

## ディレクトリ構成

### lib

- https://zenn.dev/web_tips/articles/530d02aaf90400
- component
  - アプリで使用する共通で再利用する UI を管理
- constant
  - アプリで使用する定義の管理
    - colors.dart : 色の定義
    - config.dart : 設定ファイル
    - dimens.dart : UI に関する定義
      ex) margin, size, fontSize
    - strings.dart : 文言を定義。基本的に文字列のハードコードはしない思想
    - urls.dart : URL を定義
- core
  - コアとなるクラスを管理
    ex) Firebase の Timestamp 型と Datetime 型を変換するコンバーター
- infrastructure
  - API 通信やデータベース管理
  - API を実際に通信するクラス
- model
  - アプリの型定義。freezed を使用
- provider
  - ViewModel や Repository を提供する Provider を管理。riverpod を使用
- router
  - アプリの画面遷移を担当するクラスを管理
- ui_core
  - UI に関するコアとなる機能を持つクラス
    ex) 日付型と日付文字列の変換処理(表示文字列の生成)、入力フォームのトリム処理、入力フォームのバリデーター
- view
  - アプリの画面となるクラスを管理
- view_model
  - アプリの UI ステートを保持し、画面に表示するデータを変換する役割を持つクラス
