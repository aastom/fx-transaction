class ResponseHandler
  def initialize(params)
    @code = params[:code]
    @success = params[:success] || false
    @data = params[:data] || {}
  end

  def response
    @success ? success_response : error_response
  end

  def success_response
    {
      success: @success,
      success_code: @code,
      success_messages: success_message,
      data: @data
    }
  end

  def error_response
    {
      success: @success,
      error_code: @code,
      error_messages: error_message,
      data: @data
    }
  end

  def success_message
    case @code
    when 0o01
      'Loaded transations successfully'
    when 0o02
      'Loaded transaction successfully'
    when 0o03
      'Transaction was successfully created'
    else
      'Success'
    end
  end

  def error_message
    case @code
    when 900
      'Transaction could not be created'
    else
      'Error'
    end
  end
end
