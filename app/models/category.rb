class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    # 他のカテゴリーも追加
  ]

  include ActiveHash::Associations
  has_many :articles
  
end
