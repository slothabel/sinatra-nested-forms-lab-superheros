require 'pry'
require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
        erb :index
    end

    post '/teams' do
        @team = Team.new(params[:team][:name], params[:team][:motto])
        params[:team][:members].each do |member|
            Member.new(member)
        end
        
        @member = Member.all
        # binding.pry

        erb :team
    end


end
