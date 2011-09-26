class Request < ActiveRecord::Base
  attr_accessor :words, :acronyms

  def search_for_acronyms
    split_words
    find_acronyms
    filter_unique# = filter_unique(find_acronyms)
    search_definitions
  end

  def split_words
    @words = text.split(/[^a-zA-Z]/).each{|t| t.gsub(/\W/,'NOTHING')}
  end

  def find_acronyms
    @acronyms = []
    @words.each{|word| @acronyms << word if is_acronym?(word)}#word == word.upcase}
    # TODO: Find a better matcher for acronyms: e.g. including B.B.C. and so on, and ignoring A at start of word?  include hyphens, etc, also lower-case letters
    # TODO: also a way of handling words which might be acronyms, but are uncertain 
    # TODO: check that it's not including duplicates, and if not why not - there's nothing excluding them yet!
    @acronyms
  end

  def is_acronym?(word)
    word == word.upcase && word.size > 1 ? true : false
  end

  def filter_unique
    @acronyms = acronyms.uniq
  end
  # def search_definitions(unique_acronyms)
  #   unique_acronyms.each do |unique|
  #     Acronym.where(:abbreviation => a)
  #   end
  # end   
    
  def search_definitions 
    definitions = []  # TODO: This must return an array of AR objects not just array, so that EDIT link from results_show page works
    # debugger
    @acronyms.sort!
    @acronyms.each do |a|
      found_acronym = Acronym.find_by_abbreviation(a)
      # TODO: Add this adding new unknown acronym back in
      if found_acronym.nil?
        then add_new_unknown(a) && definitions << [a,'Unknown'] # TODO: Make this less yucky, more DRY
      else definitions << found_acronym #[found_acronym.abbreviation, found_acronym.definition]
      end
    end  
    # debugger
    definitions
  end                       
  
  def add_new_unknown(abbreviation)
    Acronym.create(:abbreviation => abbreviation, :definition => 'Unknown')
  end

end
