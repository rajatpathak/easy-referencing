class FaqsController < ApplicationController

  def index
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":{"0":"success"}}')
    faqs = Faq.all.to_json.to_s
    faqs = JSON.parse(faqs)
    my_hash["data"] = faqs
    @data = my_hash.to_json.to_s

  end

  def voted_good
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    faq = Faq.find_by_id(params[:id])
    if faq.nil?
      error = 'Faq does not exist anymore'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      faq.vote_good += 1
      if faq.save
        faq = faq.to_json.to_s
        faq = JSON.parse(faq)
        my_hash["data"] = faq
      else
        error = 'Error while sending the request'
        my_hash["errorCode"] = 2
        my_hash["errorMessages"] = error
      end
    end
    @data = my_hash.to_json.to_s

  end

  def voted_bad
    my_hash = JSON.parse('{"data": null, "errorCode": 0, "errorMessages":"success"}')
    faq = Faq.find_by_id(params[:id])
    if faq.nil?
      error = 'Faq does not exist anymore'
      my_hash["errorCode"] = 1
      my_hash["errorMessages"] = error
    else
      faq.vote_bad += 1
      if faq.save
        faq = faq.to_json.to_s
        faq = JSON.parse(faq)
        my_hash["data"] = faq
      else
        error = 'Error while sending the request'
        my_hash["errorCode"] = 2
        my_hash["errorMessages"] = error
      end
    end
    @data = my_hash.to_json.to_s

  end

end
