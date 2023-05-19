FactoryBot.define do
  factory :purchase_address do
    post_code         { '888-8888' }
    prefecture_id     { 2 }
    locality          { '東京都' }
    house_number      { '1-1' }
    building          { '東京はいつ' }
    phone             { '00000000000' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
