# Service result concern

class ServiceResult
  attr_reader :value, :errors

  def initialize(was_successful, value: nil, errors: {})
    @was_successful = was_successful
    @value = value
    @errors = errors
  end

  def self.success(value = nil)
    new(true, value: value)
  end

  def self.failure(errors, value: nil)
    new(false, errors: errors, value: value)
  end

  def success?
    @was_successful
  end

  def failure?
    !@was_successful
  end
end
