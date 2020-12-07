# DB 設計

## users table
| Column               | Type   | Options                  |
| ---------------------| ------ | -------------------------|
| nickname             | string | null: false              |
| email                | string | unique: true,null: false |
| encrypted_password   | string | null: false              |
| first_name           | string | null: false              |
| first_name_kana      | string | null: false              |
| last_name            | string | null: false              |
| last_name_kana       | string | null: false              |
| birth_day             | date   | null: false              |

### Association

* has_many :items
* has_many :orders




## items table


## items table
| Column                         | Type       | Options           |
|--------------------------------|------------|-------------------|
| name                           | string     | null: false       |
| item_price                     | integer    | null: false       |
| category_id                    | integer    | null: false       |
| status_id                      | integer    | null: false       |
| item_postage_id                | integer    | null: false       |
| area_id                        | integer    | null: false       |
| days_id                        | integer    | null: false       |
| user                           | references | foreign_key: true |

### Association

- belongs_to :user 
* has_one :order



## orders table

| Column      | Type        | Options           |
|-------------|-------------|-------------------|
| item        | references  | foreign_key: true |
| user        | references  | foreign_key: true |

## Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses table
| Column             | Type        | Options             |
|--------------------|-------------|---------------------|
| area_id            | integer     | null: false         |
| postal_code        | string      | null: false         |
| city               | string      | null: false         |
| address            | string      | null: false         |
| house_number       | string      | null: false         |
| building           | string      |                     |
| phone_number       | string      | null: false         |
| order              | references  | foreign_key: true   |

## Association


- belongs_to :order

- belongs_to :order
