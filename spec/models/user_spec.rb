require 'rails_helper'

describe User do

  describe "#favorited(post)" do
    
    before do
      @user = create(:user)
      @post = create(:post, user: @user)
    end

    it "returns 'nil' if the user has not favorited the post" do
      @user.favorites
      #Use a new user from FactoryGirl#user that has no favorites. Should return `nil`

    end

    it "returns the appropriate favorite if it exists" do
      @user.favorites.where( post: @post).create

      @user.favorites
      #Use #create to make an object of a user with favorites on the post. Then return value of the user's favorites.
    end
  end

  describe ".top_rated" do

    before do
      @user1 = create(:user)
      post = create(:post, user: @user1)
      create(:comment, user: @user1, post: post)

      @user2 = create(:user)
      post = create(:post, user: @user2)
      2.times { create(:comment, user: @user2, post: post) }
    end

    it "returns users ordered by comments + posts" do
      expect( User.top_rated ).to eq([@user2, @user1])
    end

    it "stores a 'posts_count' on user" do
      users = User.top_rated
      expect( users.first.posts_count ).to eq(1)
    end

    it "stores a 'comments_count' on user" do
      users = User.top_rated
      expect( users.first.comments_count ).to eq(2)
    end
  end

end