require 'rails_helper'

RSpec.describe Author, type: :model do
  context "when creating author" do
    let(:author) {build :author}
    let(:author2) {build :author, name: author.name}
    
    it "should be valid author with some attributes" do
      expect(author.valid?).to eq(true)
    end

    it "should raise invalid record exception for duplicate name" do
      author.save
      expect(author2.save).to eq(false)
      expect{author2.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
