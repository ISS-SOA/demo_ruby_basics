# frozen_string_literal: true

## Struct
class Result
  attr_accessor :status, :message

  def initialize(status, message)
    @status = status
    @message = message
  end
end

Result = Struct.new(:status, :message)

res = Result.new('invalid_input', 'Github URL is invalid')

res.status    # => 'invalid_input'
res[:status]  # => 'invalid_input'
res['status'] # => 'invalid_input

res.status = 'internal_error'
res[:status]= 'internal_error'

Result = Struct.new(:status, :message) do
  def summarize
    "Status: #{status}, because #{message}"
  end
end

res = Result.new('invalid_input', 'Github URL is invalid')
res.summarize
# => "Status: invalid_input, because Github URL is invalid"

res.status = 'ok'

## OpenStruct
request = OpenStruct.new(
  owner_name: 'soumyaray',
  project_name: 'YPBT-app',
  project_fullname: 'soumyaray/YPBT-app',
  folder_name: 'view_objects'
)

request.project_fullname    # => 'soumyaray/YPBT-app'
request['project_fullname'] # => 'soumyaray/YPBT-app'
request[:project_fullname]  # => 'soumyaray/YPBT-app'

request.greeting = 'hello'
