class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "Welcome to the homepage"
  end

  get "/users" do
    users = User.all.order(created_at: :asc)
    users.to_json
  end

  post "/users" do 
    user = User.create(
      name:params[:name],
      username:params[:username],
      email:params[:email],
      password:params[:password]
    )
    user.to_json
  end

  get "/reports" do
    reports = User.all.order(:created_at)
    reports.to_json
  end

  post "/reports" do
    report = Report.create(
      title:params[:title],
      location:params[:location],
      comment:params[:comment],
      user_id:params[:user_id],
      type_id:params[:type_id]
    )
    report.to_json
  end

end
