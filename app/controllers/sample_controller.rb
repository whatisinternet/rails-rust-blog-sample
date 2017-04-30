require 'csv'

class SampleController < ApplicationController
  def rust
    csv_path = Rails.root.join('vendor', 'bench.csv')
    rusty_csv = RustyCSV.new.csv_to_json(csv_path.to_s)
    render plain: rusty_csv
  end

  def ruby
    csv_path = Rails.root.join('vendor', 'bench.csv')
    output = []
    CSV.foreach(csv_path.to_s, headers: true) do |thinger|
      output << thinger.to_h
    end
    render json: output
  end
end
