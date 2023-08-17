**Users（ユーザー情報）テーブル**

| Column       | Type       | Options                  |
|--------------|------------|--------------------------|
| id           | integer    |                          |
| nickname     | string     | null: false              |
| mail         | string     | null: false, unique: true|
| password     | string     | null: false              |
| name         | string     | null: false              |
| kana_name    | string     | null: false              |
| birthdate    | date       | null: false              |
| created_at   | datetime   |                          |
| updated_at   | datetime   |                          |

**Association**

- has_many :items
- has_many :purchases

**Items（商品情報）テーブル**

| Column       | Type       | Options                  |
|--------------|------------|--------------------------|
| id           | integer    |                          |
| seller_id    | integer    |                          |
| name         | string     |                          |
| description  | text       |                          |
| price        | integer    |                          |
| status       | string     |                          |
| created_at   | datetime   |                          |
| updated_at   | datetime   |                          |

**Association**

- belongs_to :user
- has_many :purchases

**Purchases（購入記録）テーブル**

| Column       | Type       | Options                  |
|--------------|------------|--------------------------|
| id           | integer    |                          |
| user_id      | integer    | foreign_key: true        |
| item_id      | integer    | foreign_key: true        |
| created_at   | datetime   |                          |
| updated_at   | datetime   |                          |

**Association**

- belongs_to :user
- belongs_to :item
- has_one :shipping_info

**ShippingInfo（発送先情報）テーブル**

| Column       | Type       | Options                  |
|--------------|------------|--------------------------|
| id           | integer    |                          |
| purchase_id  | integer    | foreign_key: true        |
| postal_code  | string     |                          |
| prefecture   | string     |                          |
| city         | string     |                          |
| address      | string     |                          |
| building     | string     |                          |
| phone_number | string     |                          |

**Association**

- belongs_to :purchase



---
補足
---

**Users（ユーザー情報）テーブル:**

- id (integer): ユーザーの一意の識別子
- nickname (string): ユーザーのニックネーム
- mail (string): ユーザーのメールアドレス
- password (string): ユーザーのパスワード
- name (string): ユーザーの氏名（全角漢字）
- kana_name (string): ユーザーの氏名のカナ表記（全角カナ）
- birthdate (date): ユーザーの生年月日
- created_at (datetime): レコードの作成日時
- updated_at (datetime): レコードの更新日時

**Items（商品情報）テーブル:**

- id (integer): 商品の一意の識別子
- seller_id (integer): 出品者（ユーザー）のID
- name (string): 商品名
- description (text): 商品の説明
- price (integer): 商品の価格
- status (string): 商品の状態
- created_at (datetime): レコードの作成日時
- updated_at (datetime): レコードの更新日時

**Purchases（購入記録）テーブル:**

- id (integer): 購入記録の一意の識別子
- user_id (integer): 購入者（ユーザー）のID
- item_id (integer): 購入された商品のID
- created_at (datetime): レコードの作成日時
- updated_at (datetime): レコードの更新日時

**ShippingInfo（発送先情報）テーブル:**

- id (integer): 発送先情報の一意の識別子
- purchase_id (integer): 購入記録のID
- postal_code (string): 郵便番号
- prefecture (string): 都道府県
- city (string): 市区町村
- address (string): 番地
- building (string): 建物名
- phone_number (string): 電話番号

---