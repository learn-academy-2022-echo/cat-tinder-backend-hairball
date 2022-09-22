require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create name:"Henry", age:100, enjoys:"sleeping", image:"www.google.com"

      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end
  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Greg',
          age: 4,
          enjoys: 'being outside',
          image: "www.www.www.com"
        }
      }

      post '/cats', params: cat_params

      expect(response).to have_http_status(200)
      cat = Cat.first
      expect(cat.name).to eq 'Greg'
    end
  end
  describe 'PATCH /update' do
    before(:each) do
      @cat = Cat.create(name: "Craig", age: 7, enjoys: "something", image: "website")
      @cat.update(:name => "Adam")
      get '/cats'
      expect(response).to have_http_status(200)
      expect(@cat).to change {@cat.name}.from("Craig").to("Adam")
    end
  end
  describe 'DELETE /delete' do
    it 'deletes a cat' do
    @cat = Cat.create(name: "Craig", age: 7, enjoys: "something", image: "website")
    @cat.destroy
    expect(Cat.count).to eq 0
    end
  end
end
