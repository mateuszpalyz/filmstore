class Rates < Grape::API
  helpers ApiHelpers::AuthenticationHelper
  format :json

  desc 'Endpoints for rates'
  resource :rates do
    before { authenticate! }

    desc 'Create rate'
    params do
      requires :film_id, type: Integer, desc: 'Film id'
      requires :value, type: Integer, desc: 'Value for given rating'
    end
    post do
      Rate.create(user: current_user, film_id: params[:film_id], value: params[:value])
    end

    desc 'Update rate'
    params do
      requires :value, type: Integer, desc: 'Value for given rating'
    end
    put ':id' do
      current_user.rates.find(params[:id]).update(value: params[:value])
    end

    desc 'Delete rate'
    params do
      requires :id, type: Integer, desc: 'Rate id'
    end
    delete ':id' do
      current_user.rates.find(params[:id]).destroy
    end
  end
end
