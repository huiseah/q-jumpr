require 'spec_helper'

describe OffersController do 
  describe 'GET for index' do
    before do
      user = User.create(:email => 'testicles@gmail.com', :password => 'a', :password_confirmation => 'a')
      # session = Session.create(:session => [:user_id])
    end
    it 'renders the index template' do 
      get :index
      expect(response).to render_template ("index")
    end
  end
end

#   describe 'GET to show' do
#     before do
#       @offer = Offer.create(:name => 'Apple Store')
#     end
#     it "should render the show template" do
#       get :show, {:id => @offer.id}
#       expect(response).to render_template("show")
#     end

#     it "should assign a offer instance variable" do
#       expect(assigns(:offers)).to be
#       expect(assigns(:offers).length).to eq(1)
#       expect(assigns(:offers).first.class).to eq(Offer)
#       expect(assigns(:offers).first.name).to eq("Apple Store")
#     end

#     it "should mention the offer on the page" do
#       expect(assigns(:offers).first.class).to eq(Offer)
#       expect(assigns(:offers).first.enddate).to eq(@offer.enddate)
#     end
#   end

  # describe 'POST to create' do
  #   describe 'a offer with valid information' do
  #     before do
  #       post :create, { :name => "SFS" }
  #     end

  #     it "should redirect to the show action" do
  #       expect(response.status).to eq(302)
  #       expect(response).to(redirect_to(offer_path(assigns(:offer))))
  #     end

  #     # This is tested in the 'GET to show' scenario above.
  #     # it "should render the show template" do
  #     #   expect(response).to render_template("show")
  #     # end

  #     it "should increase the number of offers" do
  #       expect(offer.count).to eq(1)
  #     end
  #   end

  #   describe 'a offer without a name' do
  #     before do
  #       post :create, {}
  #     end

  #     it 'should give us a 200 success' do
  #       expect(response.status).to eq(200)
  #     end

  #     it 'should render the new template' do
  #       expect(response).to render_template("new")
  #     end

  #     it 'should not increase the number of Offers' do
  #       expect(Offer.count).to eq(0)
  #     end
  #   end
  # end

# end
