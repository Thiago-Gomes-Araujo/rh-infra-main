# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "roo"

spreadsheet = Roo::Spreadsheet.open("unidades_seduc_sei.xlsx")

header = spreadsheet.row(1)

(2..spreadsheet.last_row).each do |i|
  row = Hash[[header, spreadsheet.row(i)].transpose]
  GListaOrganizacional.create!(
    sigla: row["Sigla"].upcase.gsub(/[-_]/, "").gsub("SEDUC", "").strip,
    descricao: row["Descricao"].upcase,
  )
end
