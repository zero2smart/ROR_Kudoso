require 'rails_helper'

RSpec.describe "notes/edit", :type => :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :ticket_id => 1,
      :note_type_id => 1,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do

      assert_select "input#note_ticket_id[name=?]", "note[ticket_id]"

      assert_select "input#note_note_type_id[name=?]", "note[note_type_id]"

      assert_select "input#note_title[name=?]", "note[title]"

      assert_select "textarea#note_body[name=?]", "note[body]"
    end
  end
end