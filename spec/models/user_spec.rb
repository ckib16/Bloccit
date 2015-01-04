require 'rails_helper'

describe User do

  include TestFactories

  describe "#favorited(post)" do
    
    before do
      @post = associated_post
      @user = authenticated_user
    end

    it "returns 'nil' if the user has not favorited the post" do
      @user.favorites
      #Use a new user from #authenticated_user that has no favorites. Should return `nil`

    end

    it "returns the appropriate favorite if it exists" do
      @user.favorites.where( post: @post).create

      @user.favorites
      #Use #create to make an object of a user with favorites on the post. Then return value of the user's favorites.
    end
  end

end