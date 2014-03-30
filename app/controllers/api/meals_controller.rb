module Api
	class MealsController < BaseController
		before_action :auth_only!
		def create
			# unless (params[:name] && params[:auth_token]) || (params[:name] && params[:remember_token])
			# 	return missing_params
			# end
			@meal = Meal.new
			@meal.name = params[:name]
			@meal.quantity = params[:quantity]
			@meal.time = params[:time]
			@meal.user_id = current_user.id
			# render json: {'test' => 'test'}, status: 201
			if @meal.save
				respond_with @meal, location: api_meals_url
				# redirect_to api_meal_url @meal, auth_token: params[:auth_token]
				# render json: {}, status: 201
			else
				return missing_params
			end
		end

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

