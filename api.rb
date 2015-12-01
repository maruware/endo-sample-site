require 'grape'

class API < Grape::API
  # version 'v1', using: :header
  format :json

  helpers do
    def articles
      [
        {
          id: 1,
          title: 'good',
          text: 'good content',
        },
        {
          id: 2,
          title: 'bad',
          text: 'bad content',
        },
      ]
    end

    def cors_set_access_control_headers
      header 'Access-Control-Allow-Origin', '*'
      header 'Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE, OPTIONS'
      header 'Access-Control-Allow-Headers', 'Origin, Content-Type, Accept, Authorization, Token'
      header 'Access-Control-Max-Age', "1728000"
    end
  end

  before do
    cors_set_access_control_headers
  end

  resource :articles do
    #/articles
    get do
      articles
    end

    #/articles/1
    route_param :id do
      get do
        articles.find{|a| a[:id] == params['id'].to_i}
      end

    end

    params do
      requires :title, type: String
      requires :text, type: String
    end
    post do
      {
        id: 2,
        title: params['title'],
        text: params['text'],
      }
    end

  end

end