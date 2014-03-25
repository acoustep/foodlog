module Api
	class MealsController < BaseController
		def index
			if params[:ids]
				@meals = Meal.find(params[:ids])
			else
				@meals = Meal.all
			end
			respond_with @meals
		end

		def show
			@meal = Meal.find(params[:id])
			respond_with @meal
		end
	end
end

