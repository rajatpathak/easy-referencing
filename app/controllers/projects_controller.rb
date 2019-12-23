class ProjectsController < ApplicationController

  def index
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    user = User.find_by_id(params[:user_id])
    if user.nil?
      error = 'User does not exist'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      projects = user.projects.order("id ASC").to_json.to_s
      projects = JSON.parse(projects)
      my_hash["data"] = projects
    end
    @data = my_hash.to_json.to_s
  
  end

  def show
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    project = Project.find_by_id(params[:id])
    if project.nil?
      error = 'Project does not exist'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      project = project.to_json.to_s
      project = JSON.parse(project)
      my_hash["data"] = project
    end
    @data = my_hash.to_json.to_s

  end

  def new
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    if  !(params[:name].present?) || (params[:name].size == 0)
      error = 'Name of the project can not be blank'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      project = Project.new
      project.name = params[:name]
      user = User.find_by_id(params[:user_id])
      if user.nil?
        error = 'User does not exist'
        my_hash["errorCode"] = 3
        my_hash["errorMessages"] = error
      else
        project.user_id = params[:user_id]
        if project.save
          project = project.to_json.to_s
          project = JSON.parse(project)
          my_hash["data"] = project
        else
          error = 'There is already a project with this name (for this user)'
          my_hash["errorCode"] = 2
          my_hash["errorMessages"] = error
        end
      end
    end
    @data = my_hash.to_json.to_s

  end

  def create
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    if  !(params[:name].present?) || (params[:name].size == 0)
      error = 'Name of the project can not be blank'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      project = Project.new
      project.name = params[:name]
      user = User.find_by_id(params[:user_id])
      if user.nil?
        error = 'User does not exist'
        my_hash["errorCode"] = 3
        my_hash["errorMessages"] = error
      else
        project.user_id = params[:user_id]
        if project.save
          project = project.to_json.to_s
          project = JSON.parse(project)
          my_hash["data"] = project
        else
          error = 'There is already a project with this name (for this user)'
          my_hash["errorCode"] = 2
          my_hash["errorMessages"] = error
        end
      end
    end
    data = my_hash.to_json

    render json: data

  end

  def edit
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    project = Project.find_by_id(params[:id])

    if project.nil?
      error = 'Project does not exist'
      my_hash["errorCode"] = 3
      my_hash["errorMessages"] = error
    else
      if params[:name].present?
        project.name = params[:name]
        if project.save
          project = project.to_json.to_s
          project = JSON.parse(project)
          my_hash["data"] = project
        else
          error = 'There is already a project with this name (for this user)'
          my_hash["errorCode"] = 2
          my_hash["errorMessages"] = error
        end
      else
        error = 'Name of the project can not be blank'
        my_hash["errorCode"] = 1
        my_hash["errorMessages"] = error
      end
    end
    @data = my_hash.to_json.to_s

  end

  def delete
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    project = Project.find_by_id(params[:id])

    if project.nil?
      error = 'Project does not exist'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      project.references.each do |reference|
        reference.destroy
      end
      project.destroy
      project = project.to_json.to_s
      project = JSON.parse(project)
      my_hash["data"] = project
    end
    @data = my_hash.to_json.to_s

  end

  def references
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    project = Project.find_by_id(params[:id])
    if project.nil?
      error = 'Project does not exist'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      references = project.references.to_json.to_s
      references = JSON.parse(references)
      my_hash["data"] = references
    end
    @data = my_hash.to_json.to_s
  
  end

end
