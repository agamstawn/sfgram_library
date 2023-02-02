require 'rails_helper'

RSpec.describe Book, type: :model do
  context "when creating book" do
    let(:book) {build :book}
    let(:book2) {build :book, title: book.title}
    
    it "should be valid book with some attributes" do
      expect(book.valid?).to eq(true)
    end

    it "should raise invalid record exception for duplicate title" do
      book.save
      expect(book2.save).to eq(false)
      expect{book2.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
