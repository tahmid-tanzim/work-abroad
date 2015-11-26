require 'rails_helper'

RSpec.describe "SiteLayouts", type: :request do

  describe "GET /" do
    it " root path works!" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /about" do
    it "about path works!" do
      get about_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /contact" do
    it "contact path works!" do
      get contact_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /help" do
    it "help path works!" do
      get help_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /signup" do
    it "signup path works!" do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end
end
