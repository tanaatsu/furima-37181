# テーブル設計

## users テーブル
|Column---------------|Type----------|Options------------------------|
|---------------------|--------------|-------------------------------|
|nickname-------------|string--------|null :false--------------------|
|email----------------|string--------|null :false, unique: true------|
|encrypted_password---|string--------|null :false--------------------|
|last_name------------|string--------|null :false--------------------|
|first_name-----------|string--------|null :false--------------------|
|last_name_k----------|string--------|null :false--------------------|
|first_name_k---------|string--------|null :false--------------------|
|birthday-------------|string--------|null :false--------------------|

### Association
has_many :items
has_many :comments
has_many :histories
has_one :address

## items テーブル
|Column---------------|Type----------|Options------------------------|
|---------------------|--------------|-------------------------------|
|item_name------------|string--------|null :false--------------------|
|item_text------------|text----------|null :false--------------------|
|item_price-----------|integer-------|null :false--------------------|
|item_category--------|string--------|null :false--------------------|
|item_status----------|string--------|null :false--------------------|
|postage--------------|string--------|null :false--------------------|
|prefecture_id--------|integer-------|null :false--------------------|
|days-----------------|string--------|null :false--------------------|
|user-----------------|references----|null :false , foreign_key: true|

### Association
belongs_to :user
has_many :comments
has_many :histories


## comments テーブル
|Column---------------|Type----------|Options------------------------|
|---------------------|--------------|-------------------------------|
|text-----------------|text----------|null :false--------------------|
|user-----------------|references----|null :false, foreign_key: true-|
|item-----------------|references----|null :false, foreign_ket: true-|

### Association
belongs_to :user
belongs_to :item

## addresses テーブル
|Column---------------|Type----------|Options------------------------|
|---------------------|--------------|-------------------------------|
|postal_code----------|string--------|null :false--------------------|
|prefecture_id--------|integer-------|null :false--------------------|
|municipality---------|string--------|null :false--------------------|
|address--------------|string--------|null :false--------------------|
|building_name--------|string--------|-------------------------------|
|telephone_num--------|string--------|null :false--------------------|

### Association
belongs_to :user

## histories テーブル
|Column---------------|Type----------|Options------------------------|
|---------------------|--------------|-------------------------------|
|user_id--------------|references----|null :false, foreign_key: true-|
|item_id--------------|references----|null :false, foreign_ket: true-|

### Association
belongs_to :user
belongs_to :user



