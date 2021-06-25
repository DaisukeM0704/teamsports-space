class SportsType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    {id: 2, name: 'サッカー・フットサル'}, {id: 3, name: '野球'}, {id: 4, name: 'バスケットボール'},{id: 5, name: 'バレーボール'}
  ]
    include ActiveHash::Associations
    has_many :teams
end