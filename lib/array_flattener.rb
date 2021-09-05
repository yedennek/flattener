class ArrayFlattener

  def self.flatten input
    raise ArgumentError unless input&.kind_of?(Array)
    
    output = []

    input.map do |element|
      if element.kind_of?(Array)
        output = output + flatten(element)
      else
        output << element
      end
    end

    output
  end
end
