class ArrayFlattener

  def self.flatten input_array
    return [] if input_array.empty?
    
    output = []

    input_array.each do |element|
      if element.kind_of?(Array)
        output = output + element
      else
        output << element
      end
    end

    output
  end
end
