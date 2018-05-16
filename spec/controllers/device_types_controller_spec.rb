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

RSpec.describe DeviceTypesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # DeviceType. As you add validations to DeviceType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        name: 'Activity Template',
        description: 'The description',
        os: 'OS',
        version: '1.2.2'
    }
  }

  let(:invalid_attributes) {
    {
        name: nil,
        version: 1.2
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DeviceTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  context "As an adminstrator" do
    before(:each) do
      @user = FactoryGirl.create(:user, admin: true)
      sign_in(@user)
    end

    describe "GET index" do
      it "assigns all device_types as @device_types" do
        device_type = FactoryGirl.create(:device_type)
        get :index, {}, valid_session
        expect(assigns(:device_types)).to match_array([device_type])
      end
    end

    describe "GET show" do
      it "assigns the requested device_type as @device_type" do
        device_type = DeviceType.create! valid_attributes
        get :show, {:id => device_type.to_param}, valid_session
        expect(assigns(:device_type)).to eq(device_type)
      end
    end

    describe "GET new" do
      it "assigns a new device_type as @device_type" do
        get :new, {}, valid_session
        expect(assigns(:device_type)).to be_a_new(DeviceType)
      end
    end

    describe "GET edit" do
      it "assigns the requested device_type as @device_type" do
        device_type = DeviceType.create! valid_attributes
        get :edit, {:id => device_type.to_param}, valid_session
        expect(assigns(:device_type)).to eq(device_type)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new DeviceType" do
          expect {
            post :create, {:device_type => valid_attributes}, valid_session
          }.to change(DeviceType, :count).by(1)
        end

        it "assigns a newly created device_type as @device_type" do
          post :create, {:device_type => valid_attributes}, valid_session
          expect(assigns(:device_type)).to be_a(DeviceType)
          expect(assigns(:device_type)).to be_persisted
        end

        it "redirects to the created device_type" do
          post :create, {:device_type => valid_attributes}, valid_session
          expect(response).to redirect_to(DeviceType.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved device_type as @device_type" do
          post :create, {:device_type => invalid_attributes}, valid_session
          expect(assigns(:device_type)).to be_a_new(DeviceType)
        end

        it "re-renders the 'new' template" do
          post :create, {:device_type => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          {
              name: 'New Name',
              description: 'Another description',
              os: 'New OS',
              version: '1.6.4'
          }
        }

        it "updates the requested device_type" do
          device_type = DeviceType.create! valid_attributes
          put :update, {:id => device_type.to_param, :device_type => new_attributes}, valid_session
          device_type.reload
          expect(device_type.name).to eq("New Name")
          expect(device_type.description).to eq("Another description")
          expect(device_type.os).to eq("New OS")
          expect(device_type.version).to eq("1.6.4")
        end

        it "assigns the requested device_type as @device_type" do
          device_type = DeviceType.create! valid_attributes
          put :update, {:id => device_type.to_param, :device_type => valid_attributes}, valid_session
          expect(assigns(:device_type)).to eq(device_type)
        end

        it "redirects to the device_type" do
          device_type = DeviceType.create! valid_attributes
          put :update, {:id => device_type.to_param, :device_type => valid_attributes}, valid_session
          expect(response).to redirect_to(device_type)
        end
      end

      describe "with invalid params" do
        it "assigns the device_type as @device_type" do
          device_type = DeviceType.create! valid_attributes
          put :update, {:id => device_type.to_param, :device_type => invalid_attributes}, valid_session
          expect(assigns(:device_type)).to eq(device_type)
        end

        it "re-renders the 'edit' template" do
          device_type = DeviceType.create! valid_attributes
          put :update, {:id => device_type.to_param, :device_type => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested device_type" do
        device_type = DeviceType.create! valid_attributes
        expect {
          delete :destroy, {:id => device_type.to_param}, valid_session
        }.to change(DeviceType, :count).by(-1)
      end

      it "redirects to the device_types list" do
        device_type = DeviceType.create! valid_attributes
        delete :destroy, {:id => device_type.to_param}, valid_session
        expect(response).to redirect_to(device_types_url)
      end
    end

  end

  context "As a user or member" do
    before(:each) do
      @user = FactoryGirl.create(:user, admin: false)
      sign_in(@user)
    end

    describe "GET index" do
      it "assigns all device_types as @device_types" do
        device_type = FactoryGirl.create(:device_type)
        get :index, {}, valid_session
        expect(assigns(:device_types)).to match_array([device_type])
      end
    end

    describe "GET show" do
      it "assigns the requested device_type as @device_type" do
        device_type = DeviceType.create! valid_attributes
        get :show, {:id => device_type.to_param}, valid_session
        expect(assigns(:device_type)).to eq(device_type)
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
        device_type = DeviceType.create! valid_attributes
        get :edit, {:id => device_type.to_param}, valid_session
        expect(response.status).to eq(302)
        expect(flash[:error]).to be_present
      end
    end

    describe "POST create" do
      it "does not allow create" do
        post :create, {:device_type => valid_attributes}, valid_session
        expect(response.status).to eq(302)
        expect(flash[:error]).to be_present
      end
    end

    describe "PUT update" do
      it "does not allow update" do
        device_type = DeviceType.create! valid_attributes
        put :update, {:id => device_type.to_param, :device_type => valid_attributes}, valid_session
        expect(response.status).to eq(302)
        expect(flash[:error]).to be_present
      end
    end

    describe "DELETE destroy" do
      it "does not allow delete" do
        device_type = DeviceType.create! valid_attributes
        delete :destroy, {:id => device_type.to_param, :device_type => valid_attributes}, valid_session
        expect(response.status).to eq(302)
        expect(flash[:error]).to be_present
      end
    end
  end

end