require 'rails_helper'

describe Comment do
  let (:comment) { FactoryGirl.create(:comment) }

  describe "FactoryGirl setup" do
    it "creates a comment" do
      expect(comment).to be_a(Comment)
    end
  end
end
