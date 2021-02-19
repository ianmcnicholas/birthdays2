require 'sinatra/base'

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post "/result" do
    @name = params[:name]
    @birthday = params[:birthday]
    @today = Date.today.strftime
    @age = @today.to_i - @birthday.to_i
    @birthday_this_year = Date.new((Date.today.year), (@birthday[5..6].to_i), (@birthday[8..9].to_i))
    @birthday_next_year = Date.new((Date.today.year + 1), (@birthday[5..6].to_i), (@birthday[8..9].to_i))
    @time_to_birthday_this_year = (@birthday_this_year - (Date.today)).to_i
    @time_to_birthday_next_year = (@birthday_next_year - (Date.today)).to_i
    erb(:result)
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
