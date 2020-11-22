# frozen_string_literal: true

desc 'Parse new medical procedures from Wiki page'
task parse_procedures: [:environment] do
  puts ParseProcedures.new.call
end
