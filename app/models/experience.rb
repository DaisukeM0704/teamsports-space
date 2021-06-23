class Experience < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    {id: 2, name: '半年〜1年未満'}, {id: 3, name: '1年以上〜3年未満'}, {id: 4, name: '3年以上〜5年未満'},{id: 5, name: '5年以上'}
  ]
    include ActiveHash::Associations
    has_many :users
end