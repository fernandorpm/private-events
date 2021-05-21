# frozen_string_literal: true ...
class StaticController < ApplicationController
  def home
    @events = Event.all
  end
end
