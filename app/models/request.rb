class Request < ActiveRecord::Base

  def search_for_acronyms
    words = split_words(text)
    unique_acronyms = find_unique_acronyms(words)
    # known_acronyms = find_known_acronyms(unique_acronyms)
    # find_definitions(known_acronyms
    search_definitions(unique_acronyms)
  end

  def split_words(text)
    text.split(/[^a-zA-Z]/).each{|t| t.gsub(/\W/,'NOTHING')}
  end

  def find_unique_acronyms(words)
    acronyms_to_search_for = []
    words.each{|word| acronyms_to_search_for << word if word == word.upcase}
    # TODO: Find a better matcher for acronyms: e.g. including B.B.C. and so on
    # TODO: also a way of handling words which might be acronyms, but are uncertain 
    # TODO: check that it's not including duplicates, and if not why not - there's nothing excluding them yet!
    acronyms_to_search_for
  end

  # def search_definitions(unique_acronyms)
  #   unique_acronyms.each do |unique|
  #     Acronym.where(:abbreviation => a)
  #   end
  # end   
    
  def search_definitions(acronyms) 
    definitions = {}
    acronyms.each do |a|
      found_acronym = Acronym.where(:abbreviation => a)
      if found_acronym.nil?
      # if @list[a].nil?
        then definitions[a] = "Unknown"
        # @unknown << a
      else definitions[a] = found_acronym
      end
    end 
    binding.pry
    definitions
  end

end
