class Category < ActiveHash::Base
  # class Classification < ActiveHash::Base 変更の情報

  self.data = [
    { id: 1, name: '---' },  # 修正点: id: 1 の name を '---' に変更
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'おもちゃ・ホビー・グッズ' },
    { id: 8, name: '家電・スマホ・カメラ' },
    { id: 9, name: 'スポーツ・レジャー' },
    { id: 10, name: 'ハンドメイド' },
    { id: 11, name: 'その他' }  # 修正点: id を 11 に変更
  ]

  include ActiveHash::Associations
  has_many :articles
end
