class MealPolicy
	attr_reader :user, :meal
  class Scope < Struct.new(:user, :scope)
    def resolve
			scope.where(user_id: user.id)
    end
  end

	def initialize(user, meal)
		@user = user
		@meal = meal
	end
end
