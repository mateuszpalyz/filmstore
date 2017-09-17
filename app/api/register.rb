class Register < Grape::API
  format :json
  desc 'Endpoints for register'
  namespace :register do
    desc 'Register with email and password'
    params do
      requires :email, type: String, desc: 'email'
      requires :password, type: String, desc: 'password'
    end
    post do
      user = User.new(
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password]
      )
      if user.save
        token = AuthenticationToken.generate(user)
        status 200
        present token.user, with: Entities::UserWithTokenEntity
      else
        error_msg = 'Bad Request'
        errors = user.errors.full_messages
        error!({ 'error_msg' => error_msg, 'errors' => errors }, 400)
      end
    end
  end
end
