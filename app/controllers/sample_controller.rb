require 'csv'

class SampleController < ApplicationController
  def rust
    rusty_csv = RustyCSV.new.csv_to_json(csv_path.to_s)
    render json: rusty_csv
  end

  def ruby
    ruby_csv = []
    CSV.foreach(csv_path.to_s, headers: true) do |thinger|
      ruby_csv << thinger.to_h
    end
    render json: ruby_csv
  end

private

  def csv_path
    Rails.root.join('vendor', 'bench.csv')
  end
end
