FactoryGirl.define do
  factory :session do
    token { SecureRandom.base64 20 }
    user nil
  end
end