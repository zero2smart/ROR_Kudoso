require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ActivityTypesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # ActivityType. As you add validations to ActivityType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        name: 'Activity Template',
        metadata_fields: {}
    }
  }

  let(:invalid_attributes) {
    {
        name: nil,
        metadata_fields: []
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ActivityTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  context "As an adminstrator" do
    before(:each) do
      @user = FactoryGirl.create(:user, admin: true)
      sign_in(@user)
    end

    describe "GET index" do
      it "assigns all activity_types as @activity_types" do
        activity_type = FactoryGirl.create(:activity_type)
        get :index, {}, valid_session
        expect(assigns(:activity_types)).to match_array([activity_type])
      end
    end

    describe "GET show" do
      it "assigns the requested activity_type as @activity_type" do
        activity_type = ActivityType.create! valid_attributes
        get :show, {:id => activity_type.to_param}, valid_session
        expect(assigns(:activity_type)).to eq(activity_type)
      end
    end

    describe "GET new" do
      it "assigns a new activity_type as @activity_type" do
        get :new, {}, valid_session
        expect(assigns(:activity_type)).to be_a_new(ActivityType)
      end
    end

    describe "GET edit" do
      it "assigns the requested activity_type as @activity_type" do
        activity_type = ActivityType.create! valid_attributes
        get :edit, {:id => activity_type.to_param}, valid_session
        expect(assigns(:activity_type)).to eq(activity_type)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new ActivityType" do
          expect {
            post :create, {:activity_type => valid_attributes}, valid_session
          }.to change(ActivityType, :count).by(1)
        end

        it "assigns a newly created activity_type as @activity_type" do
          post :create, {:activity_type => valid_attributes}, valid_session
          expect(assigns(:activity_type)).to be_a(ActivityType)
          expect(assigns(:activity_type)).to be_persisted
        end

        it "redirects to the created activity_type" do
          post :create, {:activity_type => valid_attributes}, valid_session
          expect(response).to redirect_to(ActivityType.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved activity_type as @activity_type" do
          post :create, {:activity_type => invalid_attributes}, valid_session
          expect(assigns(:activity_type)).to be_a_new(ActivityType)
        end

        it "re-renders the 'new' template" do
          post :create, {:activity_type => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          {
              name: 'New Template',
              metadata_fields: { title: 'My Title' }
          }
        }

        it "updates the requested activity_type" do
          activity_type = ActivityType.create! valid_attributes
          put :update, {:id => activity_type.to_param, :activity_type => new_attributes}, valid_session
          activity_type.reload
          expect(activity_type.name).to eq("New Template")
          expect(activity_type.metadata_fields[:title]).to eq("My Title")

        end

        it "assigns the requested activity_type as @activity_type" do
          activity_type = ActivityType.create! valid_attributes
          put :update, {:id => activity_type.to_param, :activity_type => valid_attributes}, valid_session
          expect(assigns(:activity_type)).to eq(activity_type)
        end

        it "redirects to the activity_type" do
          activity_type = ActivityType.create! valid_attributes
          put :update, {:id => activity_type.to_param, :activity_type => valid_attributes}, valid_session
          expect(response).to redirect_to(activity_type)
        end
      end

      describe "with invalid params" do
        it "assigns the activity_type as @activity_type" do
          activity_type = ActivityType.create! valid_attributes
          put :update, {:id => activity_type.to_param, :activity_type => invalid_attributes}, valid_session
          expect(assigns(:activity_type)).to eq(activity_type)
        end

        it "re-renders the 'edit' template" do
          activity_type = ActivityType.create! valid_attributes
          put :update, {:id => activity_type.to_param, :activity_type => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested activity_type" do
        activity_type = ActivityType.create! valid_attributes
        expect {
          delete :destroy, {:id => activity_type.to_param}, valid_session
        }.to change(ActivityType, :count).by(-1)
      end

      it "redirects to the activity_types list" do
        activity_type = ActivityType.create! valid_attributes
        delete :destroy, {:id => activity_type.to_param}, valid_session
        expect(response).to redirect_to(activity_types_url)
      end
    end

  end

  context "As a user or member" do
    before(:each) do
      @user = FactoryGirl.create(:user, admin: false)
      sign_in(@user)
    end

    describe "GET index" do
      it "assigns all activity_types as @activity_types" do
        activity_type = FactoryGirl.create(:activity_type)
        get :index, {}, valid_session
        expect(assigns(:activity_types)).to match_array([activity_type])
      end
    end

    describe "GET show" do
      it "assigns the requested activity_type as @activity_type" do
        activity_type = ActivityType.create! valid_attributes
        get :show, {:id => activity_type.to_param}, valid_session
        expect(assigns(:activity_type)).to eq(activity_type)
      end
    end

    describe "GET new" do
      it "does not allow new" do
        get :new, {}, valid_session
        expect(response.status).to eq(302)
        expect(flash[:error]).to be_present
      end
    end

    describe "GET edit" do
      it "does not allow edit" do
        activity_type = ActivityType.create! valid_attributes
        get :edit, {:id => activity_type.to_param}, valid_session
        expect(response.status).to eq(302)
        expect(flash[:error]).to be_present
      end
    end

    describe "POST create" do
      it "does not allow create" do
        post :create, {:activity_type => valid_attributes}, valid_session
        expect(response.status).to eq(302)
        expect(flash[:error]).to be_present
      end
    end

    describe "PUT update" do
      it "does not allow update" do
        activity_type = ActivityType.create! valid_attributes
        put :update, {:id => activity_type.to_param, :activity_type => valid_attributes}, valid_session
        expect(response.status).to eq(302)
        expect(flash[:error]).to be_present
      end
    end

    describe "DELETE destroy" do
      it "does not allow delete" do
        activity_type = ActivityType.create! valid_attributes
        delete :destroy, {:id => activity_type.to_param, :activity_type => valid_attributes}, valid_session
        expect(response.status).to eq(302)
        expect(flash[:error]).to be_present
      end
    end
  end

end