FactoryGirl.define do
  factory :post do
    title { FFaker::Lorem.phrase }
    body { FFaker::Lorem.paragraph(10) }
  end
end
