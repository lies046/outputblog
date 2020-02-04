require 'rails_helper'
describe Comment do
  describe '#create' do
    it 'is valid with a text' do
      @comment = create(:comment)
      expect(@comment).to be_valid
    end

    it "is invalid without a Text" do
      comment = build(:comment, text: "")
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end

    it "is invalid with a text that has more than 20 characters " do
      comment = build(:comment, text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      comment.valid?
      expect(comment.errors[:text]).to include("is too long (maximum is 20 characters)")
    end

    it "is valid with a text that has less than 3 characters " do
      comment = build(:comment, text: "aa")
      comment.valid?
      expect(comment.errors[:text]).to include("is too short (minimum is 3 characters)")
    end

    it "is valid with a nickname that has less than 6 characters " do
      comment = build(:comment, text: "aaaaaa")
      comment.valid?
      expect(comment).to be_valid
    end
  end
end