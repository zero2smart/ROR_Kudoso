require 'rails_helper'

RSpec.describe "TodoGroups", :type => :request do
  describe "GET /todo_groups" do
    it "works! (now write some real specs)" do
      skip('build valid requests')
      get todo_groups_path
      expect(response).to have_http_status(200)
    end
  end
end