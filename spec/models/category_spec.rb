require 'rails_helper'

RSpec.describe Category, type: :model do
  it "Category has a name" do
    cat = Category.create(name: "Chinese")

    expect(cat.name).to eq("Chinese")
  end
end
