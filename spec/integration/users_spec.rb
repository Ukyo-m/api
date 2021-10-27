require 'swagger_helper'

describe 'Users API' do
  path '/api/v1/users' do
    post 'Create a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user_name: { type: :string },
          user_age: { type: :integer }
        },
        required: ['title', 'content']
      }

      response '201', 'user created' do
        let(:user) {{user_name: 'hogehoge', user_age: '12' }}
        run_test!
      end
      
      response '422', 'invalid request' do
        let(:user) {{user_name: 'hogehoge', user_age: 'あああああ' }}
        run_test!
      end
    end
  end
end