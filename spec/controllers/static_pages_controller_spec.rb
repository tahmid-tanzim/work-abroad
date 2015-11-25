require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "responds successfully with an HTTP 200 status code" do
      get :home
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the #home template" do
      get :home
      expect(response).to render_template("home")
      expect(response.body).to eq ""
    end
  end

  describe "GET #help" do
    it "responds successfully with an HTTP 200 status code" do
      get :help
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the #help template" do
      get :help
      expect(response).to render_template("help")
      expect(response.body).to eq ""
    end
  end

  describe "GET #about" do
    it "responds successfully with an HTTP 200 status code" do
      get :about
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the #about template" do
      get :about
      expect(response).to render_template("about")
      expect(response.body).to eq ""
    end
  end

  describe "GET #contact" do
    it "responds successfully with an HTTP 200 status code" do
      get :contact
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the #contact template" do
      get :contact
      expect(response).to render_template("contact")
      expect(response.body).to eq ""
    end
  end  
  
end
