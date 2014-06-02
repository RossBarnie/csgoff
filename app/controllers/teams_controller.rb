class TeamsController < ApplicationController

	def new
	end

	def create
		render plain: params[:team].inspect
	end
end
