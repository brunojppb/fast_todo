module ErrorSerializer

  def ErrorSerializer.dasherize(str)
    str.to_s.gsub('_', '-')
  end

  def ErrorSerializer.serialize(errors)
    return if errors.nil?

    json = {}
    new_hash = errors.to_hash(true).map do |k, v|
      v.map do |msg|
        { id: ErrorSerializer.dasherize(k), title: msg, detail: msg, source: { pointer: "data/attributes/#{ErrorSerializer.dasherize(k)}" } }
      end
    end.flatten
    json[:errors] = new_hash
    json
  end

end
