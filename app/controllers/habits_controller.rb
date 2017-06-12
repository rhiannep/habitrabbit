class HabitsController < ApplicationController
  before_action :authenticate_user!
    def index
      @habits = current_user.habits
    end

    def show
      @habits = current_user.habits
      @habit = @habits.find(params[:id])
    end

    def create
      @habit = current_user.habits.new(habit_params)
      @habit.save
      redirect_to @habit
    end

    def destroy
      Habit.delete(habit_params)
    end

    private

    def habit_params
      params.require(:habit).permit(:name)
    end
end
