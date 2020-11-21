class ParseProcedures
  require 'nokogiri'
  require 'open-uri'
  URL = "https://en.wikipedia.org/wiki/Medical_procedure#List_of_medical_procedures"

  def initialize
  end

  def call
    doc = Nokogiri::HTML(URI.open(URL))

    i = 0
    doc.css('.mw-parser-output h3').each do |link|
      category = link.css('.mw-headline').first.content
      link.css('+ ul').each do |ul|
        ul.css('li').each do |li|
          procedure = li.css('a')[0].content

          model = MedicalProcedure.create_with(category: category).find_or_initialize_by(name: procedure)

          # i += model.new_record? ? 1 : 0;
          # model.save!
          i += if model.new_record?
                model.save!
                1
              else
                0
              end
        end
      end
    end

    "Parsed #{i} new records";
  end
end
