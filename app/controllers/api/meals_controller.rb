module Api
	class MealsController < BaseController
		before_action :auth_only!
		def index
			# if params[:ids]
			# 	@meals = Meal.find(params[:ids])
			# else
			@meals = MealPolicy::Scope.new(current_user, Meal).resolve
			# end
			respond_with @meals
		end

		def show
			@meal = Meal.find(params[:id])
			authorize @meal
			respond_with @meal
		end
	end
end

