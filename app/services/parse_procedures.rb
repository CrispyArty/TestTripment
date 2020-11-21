# frozen_string_literal: true

class ParseProcedures
  require 'nokogiri'
  require 'open-uri'
  URL = 'https://en.wikipedia.org/wiki/Medical_procedure#List_of_medical_procedures'

  def initialize; end

  def call
    doc = Nokogiri::HTML(URI.open(URL))

    list = parse(doc)

    "Parsed #{save_list(list)} new records"
  end

  private

  def save_list(list)
    list.map do |item|
      model = MedicalProcedure.create_with(category: item[:category]).find_or_initialize_by(name: item[:name])
      was_new = model.new_record?
      model.save!
      was_new ? 1 : 0
    end.reduce(:+)
  end

  def parse(doc)
    [].tap do |list|
      doc.css('.mw-parser-output h3').each do |link|
        category = link.css('.mw-headline').first.content
        link.css('+ ul').each do |ul|
          ul.css('li').each do |li|
            list << { category: category, name: li.css('a')[0].content }
          end
        end
      end
    end
  end
end
