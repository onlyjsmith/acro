class Request < ActiveRecord::Base

  def search_acronyms
    puts "here"
    self.inspect
    puts "nothing?"
    # puts @text
    return @text
    words = split_words(text)
    unique_acronyms = find_unique_acronyms(words)
    search_definitions(unique_acronyms)
  end

  def split_words(text)
    text.split(/[^a-zA-Z]/).each{|t| t.gsub(/\W/,'NOTHING')}
  end

  def find_unique_acronyms(words)
    acronyms = []
    words.each{|word| acronyms << word if word == word.upcase}
    acronyms
  end

  def search_definitions(acronyms) 
    definitions = {}
    acronyms.each do |a|
      if @list[a].nil?
        then definitions[a] = "Unknown"
        puts "a is " + a.to_s
        @unknown << a
      else definitions[a] = @list[a]
      end
    end
    #binding.pry
    definitions
  end

  def print_output(defs)
    puts "Definitions for you are:"
    defs.each do |d|
      puts d[0].to_s + " | " + d[1].to_s unless d[0].empty?
    end
  end



end
