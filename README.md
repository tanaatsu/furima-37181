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
|birthday-------------|date----------|null :false--------------------|

### Association
has_many :items
has_many :records
has_many :comments


## items テーブル
|Column---------------|Type----------|Options------------------------|
|---------------------|--------------|-------------------------------|
|name-----------------|string--------|null :false--------------------|
|text-----------------|text----------|null :false--------------------|
|price----------------|integer-------|null :false--------------------|
|category_id----------|integer-------|null :false--------------------|
|status_id------------|integer-------|null :false--------------------|
|postage_id-----------|integer-------|null :false--------------------|
|prefecture_id--------|integer-------|null :false--------------------|
|shipping_day_id------|integer-------|null :false--------------------|
|user-----------------|references----|null :false , foreign_key: true|

### Association
belongs_to :user
has_many :comments
has_one :record


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
|record---------------|references----|null :false, foreign_key: true-|

### Association
belongs_to :record

## records テーブル
|Column---------------|Type----------|Options------------------------|
|---------------------|--------------|-------------------------------|
|user-----------------|references----|null :false, foreign_key: true-|
|item-----------------|references----|null :false, foreign_ket: true-|

### Association
belongs_to :user
belongs_to :item
belongs_to :address



