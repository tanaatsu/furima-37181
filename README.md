# テーブル設計

## users テーブル
|Column---------------|Type----------|Options------------------------|
|---------------------|--------------|-------------------------------|
|nickname-------------|string--------|null :false--------------------|
|email----------------|string--------|null :false--------------------|
|encrypted_password---|string--------|null :false--------------------|
|last_name------------|string--------|null :false--------------------|
|first_name-----------|string--------|null :false--------------------|
|last_name(k)---------|string--------|null :false--------------------|
|first_name(k)--------|string--------|null :false--------------------|

### Association
has_many :items
has_many :purchases
has_many :comments

## items テーブル
|Column---------------|Type----------|Options------------------------|
|---------------------|--------------|-------------------------------|
|item_name------------|string--------|null :false--------------------|
|item_text------------|string--------|null :false--------------------|
|item_image-----------|string--------|null :false--------------------|
|item_price-----------|integer-------|null :false--------------------|
|user_id--------------|references----|null :false , foreign_key: true|

### Association
belongs_to :user
has_many :comments
has_one :purchase

## comments テーブル
|Column---------------|Type----------|Options------------------------|
|---------------------|--------------|-------------------------------|
|text-----------------|text----------|null :false--------------------|
|user_id--------------|references----|null :false, foreign_key: true-|
|item_id--------------|references----|null :false, foreign_ket: true-|

### Association
belongs_to :user
belongs_to :item

## purchases テーブル
|Column---------------|Type----------|Options------------------------|
|---------------------|--------------|-------------------------------|
|card_num-------------|integer-------|null :false--------------------|
|valid_month----------|integer-------|null :false--------------------|
|valid_day------------|integer-------|null :false--------------------|
|security_code--------|integer-------|null :false--------------------|
|postal_code----------|integer-------|null :false--------------------|
|prefectures----------|string--------|null :false--------------------|
|municipality---------|string--------|null :false--------------------|
|address--------------|string--------|null :false--------------------|
|building_name--------|string--------|-------------------------------|
|telephone_num--------|integer-------|null :false--------------------|
|user_id--------------|references----|null :false, foreign_key: true-|

### Association
belongs_to :user
belongs_to :item

