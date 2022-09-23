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
    let!(:cat) {
      Cat.create(
        name: 'Greg',
        age: 4,
        enjoys: 'being outside',
        image: "www.www.www.com"
      )
    }
    it 'updates valid cat attributes' do 
      cat_params = {
        cat: {
          name: 'Craig',
          age: 4,
          enjoys: 'being outside',
          image: "www.www.www.com"
        }
      }
      patch "/cats/#{cat.id}", params: cat_params

      expect(response).to have_http_status(200)
      catHash = JSON.parse(response.body).deep_symbolize_keys
      expect(catHash[:name]).to eq("Craig")
    end
  end
  describe 'DELETE /delete' do
    it 'deletes a cat' do
      deleteCat = Cat.create name:"Henry", age:100, enjoys:"sleeping", image:"www.google.com"
      delete "/cats/#{deleteCat.id}"
      expect(response.status).to eq(204)
      expect(Cat.count).to eq 0
    end
  end
end
