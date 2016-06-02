FactoryGirl.define do
  factory :image do
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/ruby.png')))
  end
end