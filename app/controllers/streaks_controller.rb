class StreaksController < ApplicationController
  before_action :authenticate_user!
  def create
    @habit = Habit.find(streak_params[:habit][:id])
    today = Time.zone.today
    yesterday = Time.zone.yesterday
    redirect_to update if(@habit.streaks.find_by(end: yesterday))
    break if(@habit.streaks.find_by(end: today))
    @habit.streaks.build(days: 1, start: today, end: today)
    redirect_to @habit
  end

  def update
    @habit = Habit.find(streak_params[:habit][:id])
    @streak = @habit.streaks.find_by(Time.zone.yesterday)
    @streak.days++
    @streak.end = Time.zone.today
  end

  def destroy
    Streak.delete(habit_params)
  end

  private

  def streak_params
    params.require(:habit).permit(:id)
  end
end
