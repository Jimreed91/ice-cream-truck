module ApiHelpers

  def json_body
    JSON.parse(response.body)
  end

  Rspec.configure do |config|
    config.include ApiHelpers, type: :request
  end

end
