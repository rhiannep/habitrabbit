class HabitsController < ApplicationController
  before_action :authenticate_user!
    def index
      @habits = current_user.habits
    end

    before_action :authenticate_user!
    def show
      @habits = current_user.habits
      @habit = @habits.find(params[:id])
      best_streak = @habit.streaks.order(:days).last
      current_streak = @habit.streaks.find_by(end: Time.zone.now.to_date)
      @best_streak_days = best_streak ? best_streak.days : 0;
      @current_streak_days = current_streak ? current_streak.days : 0;
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
