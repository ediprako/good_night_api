# frozen_string_literal: true

class ApplicationSerializer
  include JSONAPI::Serializer

  def to_h
    data = serializable_hash
    data_condition(data)
  end

  def data_condition(data)
    case data[:data]
    when Hash
      data[:data][:attributes]
    when Array
      data[:data].map { |x| x[:attributes] }
    when nil
      nil
    else
      data
    end
  end
end
