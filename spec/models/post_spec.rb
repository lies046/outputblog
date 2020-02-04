require 'rails_helper'
describe Post do
  describe '#create' do
    it 'is valid with a Ttile,content' do
      @post = create(:post)
      expect(@post).to be_valid
    end
    
    it "is invalid without a Title" do
      post = build(:post, title: "")
      post.valid?
      expect(post.errors[:title]).to include("can't be blank")
    end

    it "is invalid without a content" do
      post = build(:post, content: "")
      post.valid?
      expect(post.errors[:content]).to include("can't be blank")
    end

    it "is invalid with a title that has more than 30 characters " do
      post = build(:post, title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      post.valid?
      expect(post.errors[:title]).to include("is too long (maximum is 30 characters)")
    end
  end
end
