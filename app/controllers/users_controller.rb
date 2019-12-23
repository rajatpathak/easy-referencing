class UsersController < ApplicationController

  # Showing all the users
  def index
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    # users = []
    # all = User.all
    # all.each do |user|
    #   user = user.to_json.to_s
    #   user = JSON.parse(user)
    #   user.delete("password_digest")  
    #   users << user
    # end
    # my_hash["data"] = users
    @data = my_hash.to_json.to_s
  
  end

  # Show the user
  def show
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    # user = User.find_by_id(params[:id])
    # if user.nil?
    #   my_hash["errorCode"] = 1 
    #   error = 'User does not exist'
    #   my_hash["errorMessages"] = error
    # else
    #   user = user.to_json.to_s
    #   user = JSON.parse(user)
    #   user.delete("password_digest")
    #   my_hash["data"] = user
    # end
    @data = my_hash.to_json.to_s
  
  end

  # Create a new user
  def new
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    user = User.new
    user.name = params[:name]
    user.password_digest = params[:password]
    user.email = params[:email].delete '\"'
    if user.save
      project = Project.new
      project.name = "Uncategorized"
      project.user_id = user.id
      project.save
      user = user.to_json.to_s
      user = JSON.parse(user)
      user.delete("password_digest")
      message = user
      

      my_hash["data"] = user
    else
      if user.errors["name"].present?
        error = 'Name can not be blank'
        my_hash["errorCode"] = 1
        my_hash["errorMessages"] = error
      end
      if user.errors["password"].present?
        error = 'Password can nott be blank'
        my_hash["errorCode"] = 2
        my_hash["errorMessages"] = error
      end
      if user.errors["email"].present?
        user.errors["email"].each do |message|
          if message == "has already been taken"
            error = 'E-mail already been taken'
            my_hash["errorCode"] = 4
            my_hash["errorMessages"] = error
          else
            error = 'E-mail can not be blank'
            my_hash["errorCode"] = 3
            my_hash["errorMessages"] = error
          end
        end
      end
    end
    @data =  my_hash.to_json.to_s

  end

  def create
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    user = User.new
    user.name = params[:name]
    user.password_digest = params[:password]
    user.email = params[:email].delete '\"'
    if user.save
      project = Project.new
      project.name = "Uncategorized"
      project.user_id = user.id
      project.save
      user = user.to_json.to_s
      user = JSON.parse(user)
      user.delete("password_digest")
      message = user
      

      my_hash["data"] = user
    else
      if user.errors["name"].present?
        error = 'Name can not be blank'
        my_hash["errorCode"] = 1
        my_hash["errorMessages"] = error
      end
      if user.errors["password"].present?
        error = 'Password can nott be blank'
        my_hash["errorCode"] = 2
        my_hash["errorMessages"] = error
      end
      if user.errors["email"].present?
        user.errors["email"].each do |message|
          if message == "has already been taken"
            error = 'E-mail already been taken'
            my_hash["errorCode"] = 4
            my_hash["errorMessages"] = error
          else
            error = 'E-mail can not be blank'
            my_hash["errorCode"] = 3
            my_hash["errorMessages"] = error
          end
        end
      end
    end
    data =  my_hash.to_json.to_s

    render json: data

  end

  # Edit the user
  def edit
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    user = User.find_by_id(params[:id])

    if user.nil?
      error = 'User can not be found'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      if params[:name].present?
        user.name = params[:name]
      end

      if params[:password].present?
        user.password_digest = params[:password]
      end

      if params[:email].present?
        user.email = params[:email]
      end

      if user.save
        user = user.to_json.to_s
        user = JSON.parse(user)
        my_hash["data"] = user
      else
        error = 'E-mail already been taken'
        my_hash["errorCode"] = 2
        my_hash["errorMessages"] = error
      end
    end

    @data = my_hash.to_json.to_s

  end

  #  Delete the user
  def delete
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    # user = User.find_by_id(params[:id])

    # if user.nil?
    #   error = 'User does not exist'
    #   my_hash["errorCode"] = 1
    #   my_hash["errorMessages"] = error
    # else
    #   user.destroy
    #   user = user.to_json.to_s
    #   user = JSON.parse(user)
    #   my_hash["data"] = user
    # end
    @data = my_hash.to_json.to_s
  end

  #  Show projects of the user
  def projects
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    user = User.find_by_id(params[:id])

    if user.nil?
      error = 'User does not exist'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      projects = user.projects.to_json.to_s
      projects = JSON.parse(projects)
      my_hash["data"] = projects
    end
    @data = my_hash.to_json.to_s

  end

  def login
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    

    if params[:email].present?
      user = User.find_by_email(params[:email])
      puts params[:email]
      if user.nil?
        error = 'User does not exist'
        my_hash["errorCode"] = 2
        my_hash["errorMessages"] = error
      else
        if params[:password].present?
          if (user.password_digest == params[:password])
            user = user.to_json.to_s
            user = JSON.parse(user)
            user.delete("password_digest")
            my_hash["data"] = user
          else
            error = 'Incorect password email combination'
            my_hash["errorCode"] = 4
            my_hash["errorMessages"] = error
          end
        else
          error = 'Password field must be completed'
          my_hash["errorCode"] = 3
          my_hash["errorMessages"] = error
        end
      end
    else
      error = 'Email field must be completed'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    end
    render json: my_hash


  end

end
