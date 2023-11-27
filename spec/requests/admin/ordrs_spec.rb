# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Ordrs', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/admin/ordrs/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/admin/ordrs/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/admin/ordrs/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/admin/ordrs/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
