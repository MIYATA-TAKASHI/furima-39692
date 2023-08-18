**Users（ユーザー情報）テーブル**

| Column             | Type       | Options                  |
|--------------------|------------|--------------------------|
| nickname           | string     | null: false              |
| email              | string     | unique: true             |
| encrypted_password | string     | unique: true             |
| last_name          | string     | null: false              |
| first_name         | string     | null: false              |
| kana_last_name     | string     | null: false              |
| kana_first_name    | string     | null: false              |
| birthdate_id       | date       | foreign_key: true        |

**Association**

- has_many :items
- has_many :purchases

**Items（商品情報）テーブル**

| Column                 | Type       | Options                              |
|------------------------|------------|--------------------------------------|
| nickname               | references | null: false                          |
| name                   | string     | null: false                          |
| category_id            | integer    | null: false                          |
| description            | text       | null: false                          |
| price                  | integer    | null: false                          |
| status_id              | integer    | null: false                          |
| delivery_fee_burden_id | integer    | null: false                          |
| shipping_origin_id     | integer    | null: false                          |
| days_until_shipping_id | integer    | null: false                          |

**Association**

- belongs_to :user
- has_one :purchases

**Purchases（購入記録）テーブル**

| Column       | Type       | Options                  |
|--------------|------------|--------------------------|
| user         | references | foreign_key: true        |
| item         | references | foreign_key: true        |

**Association**

- belongs_to :user
- belongs_to :item

**ShippingInfo（発送先情報）テーブル**

| Column          | Type       | Options                              |
|-----------------|------------|--------------------------------------|
| purchase        | references | null: false                          |
| postal_code     | string     | null: false                          |
| prefecture_id   | integer    | null: false                          |
| city            | string     | null: false                          |
| address         | string     | null: false                          |
| building        | string     | null: false                          |
| phone_number    | string     | null: false                          |

**Association**

- belongs_to :purchase



---
補足
---

**Users（ユーザー情報）テーブル:**

- nickname (string): ユーザーのニックネーム
- mail (string): ユーザーのメールアドレス
- password (string): ユーザーのパスワード
- last_name (string): ユーザーの姓（全角漢字）
- first_name (string): ユーザーの名（全角漢字）
- kana_last_name (string): ユーザーの姓のカナ表記（全角カナ）
- kana_first_name (string): ユーザーの名のカナ表記（全角カナ）
- birthdate_id (integer): ユーザーの生年月日

**Items（商品情報）テーブル:**

- nickname (string): 出品者（ユーザーのニックネーム）
- name (string): 商品名
- description (text): 商品の説明
- category_id (integer): 商品の分類
- price (integer): 商品の価格
- status_id (integer): 商品の状態
- delivery_fee_burden_id (integer): 配送料の負担 
- shipping_origin_id (integer): 発送元
- days_until_shipping_id (integer): 発送までの日数


**Purchases（購入記録）テーブル:**

- user (integer): 購入者（ユーザー）のID
- item (integer): 購入された商品のID

**ShippingInfo（発送先情報）テーブル:**

- purchase_id (integer): 購入記録のID
- postal_code (string): 郵便番号
- prefecture_id (integer): 都道府県
- city (string): 市区町村
- address (string): 番地
- building (string): 建物名
- phone_number (string): 電話番号

---