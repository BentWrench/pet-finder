class PagesController < ApplicationController

  def index
    @pets = Pet.all
    @last = Pet.last(3)
  end
end
