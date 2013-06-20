class CSVReader
  attr_accessor :fname, :headers

  #Saves filename to instance varible fname
  def initalize(filename)
    @fname = filename
  end

  #Splits header into a string and cleans it up by removing " and stripping new lines
  def headers=(header_str)
    @headers = header_str.split(',')

    @headers.map! do |h|

      new_header = h.gsub(/'"'/) { "" }

      new_header.strip!

      new_header.underscore.to_sym

    end
  end
 
  def create_hash(values)
    h = {}
    @headers.each_with_index do |header, i|
      # remove new lines from the value
      value = values[i].strip.gsub('"', '')
      h[header] = value unless value.empty?
    end
    h
  end

end

class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

  