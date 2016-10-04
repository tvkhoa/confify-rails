class TestController < ApplicationController
  layout "store"
  def index
  end


  def test_post
  	@result = Hash.new 
  	if params[:header]
	  	logger.warn "*** BEGIN RAW REQUEST HEADERS ***"

		self.request.env.each do |header|
		  logger.warn "#{header[0]} : #{header[1]}"
		  temp = Hash.new
		  temp[header[0]] = header[1]
		  @result.merge!(temp)
		end

		logger.warn "*** END RAW REQUEST HEADERS ***"
		logger.warn "*** *********************** ***"
		logger.warn "*** *********************** ***"
	end


	logger.warn "*** BODY ***"

	logger.warn "#{request.body}"

	logger.warn "*** PARAM ***"

	logger.warn "#{params}"



  	render json: { header: @result.to_s, class_body: "#{request.body}" , :body_content => request.body , :params => params }
  end

  def store
  	
  end

end
