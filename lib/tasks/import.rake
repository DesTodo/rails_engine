require 'csv'

namespace :import_csv do
  desc "resets database"
  task :regenerate do
    Rails.env = "development"
    Rake::Task["db:reset"].invoke
    Rails.env = "test"
    Rake::Task["db:reset"].invoke
  end

  desc "loads data from csv files"

  task :merchants => [:environment] do
    puts "Importing the merchants file for you darling..."
    # Merchant.destroy_all
    CSV.foreach("#{Rails.root}/db/csv/merchants.csv", headers: true, header_converters: :symbol) do |row|
      Merchant.create!(row.to_h)
    end
    puts 'Merchants imported darling'
  end

  task :items => [:environment] do
    puts 'Importing the items file for you darling...'
    # Item.destroy_all
    CSV.foreach("#{Rails.root}/db/csv/items.csv", headers: true, header_converters: :symbol) do |row|
      Item.create!(row.to_h)
    end
    puts 'Items imported darling'
  end

  task :invoices => [:environment] do
    puts 'Importing the invoices file for you darling...'
    # Invoice.destroy_all
    CSV.foreach("#{Rails.root}/db/csv/invoices.csv", headers: true, header_converters: :symbol) do |row|
      Invoice.create!(row.to_h)
    end
    puts 'Invoices imported darling'
  end

  task :invoice_items => [:environment] do
    puts 'Importing the invoice_items file for you darling...'
    # InvoiceItem.destroy_all
    CSV.foreach("#{Rails.root}/db/csv/invoice_items.csv", headers: true, header_converters: :symbol) do |row|
      InvoiceItem.create!(row.to_h)
    end
    puts 'Invoice_items imported darling'
  end

  task :transactions => [:environment] do
    puts 'Importing the transactions file for you darling...'

    CSV.foreach("#{Rails.root}/db/csv/transactions.csv", headers: true, header_converters: :symbol) do |row|
      Transaction.create!(row.to_h)
    end
    puts 'Transactions imported darling'
  end

  task :customers => [:environment] do
    puts 'Importing the customers file for you darling...'
    CSV.foreach("#{Rails.root}/db/csv/customers.csv", headers: true, header_converters: :symbol) do |row|
      Customer.create!(row.to_h)
    end
    puts 'Customers imported darling'
  end
  task :all => [:regenerate, :customers, :merchants, :items, :invoices, :invoice_items, :transactions]
end