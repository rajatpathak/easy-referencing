class ReferencesController < ApplicationController

  layout false;

  def index
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    project = Project.find_by_id(params[:project_id])
    if project.nil?
      error = 'Project does not exist'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      references = project.reference.to_json.to_s
      references = JSON.parse(references)
      my_hash["data"] = references
    end
    @data = my_hash.to_json.to_s

  end

  def show
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    reference = Reference.find_by_id(params[:id])
    if reference.nil?
      error = 'Project does not exist'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      reference = reference.to_json.to_s
      reference = JSON.parse(reference)
      my_hash["data"] = reference
    end
    @data = my_hash.to_json.to_s

  end

  def new
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    reference = Reference.new
    reference.reference_type = params[:reference_type]
    reference.data = params[:data]
    reference.project_id = params[:project_id]
    if reference.save
      reference = reference.to_json.to_s
      reference = JSON.parse(reference)
      my_hash["data"] = reference
    else
      error = 'Error while saving the reference'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    end
    @data = my_hash.to_json.to_s

  end

  def create

    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    reference = Reference.new
    reference.reference_type = params[:reference_type]
    reference.data = params[:data]
    reference.project_id = params[:project_id]
    if reference.save
      reference = reference.to_json.to_s
      reference = JSON.parse(reference)
      my_hash["data"] = reference
    else
      error = 'Error while saving the reference'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    end

    data = my_hash.to_json

    render json: data 
    
  end

  def edit
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    reference = Reference.find_by_id(params[:id])

    if reference.nil?
      error = 'Reference does not exist'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      if params[:reference_type].present?
        reference.reference_type = params[:reference_type]
      end
      if params[:data].present?
        reference.data = params[:data]
      end
      if params[:project_id].present?
        if !Project.find_by_id(params[:project_id]).nil?
          reference.project_id = params[:project_id]
        end
      end

      if reference.save
        reference = reference.to_json.to_s
        reference = JSON.parse(reference)
        my_hash["data"] = reference
      else
        error = 'Error while saving the reference'
        my_hash["errorCode"] = 2
        my_hash["errorMessages"] = error
      end
    end
    @data = my_hash.to_json.to_s

  end

  def delete
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    reference = Reference.find_by_id(params[:id])

    if reference.nil?
      error = 'Reference does not exist'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      reference.destroy
      reference = reference.to_json.to_s
      reference = JSON.parse(reference)
      my_hash["data"] = reference
    end
    @data = my_hash.to_json.to_s

  end
end
