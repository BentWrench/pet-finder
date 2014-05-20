class PagesController < ApplicationController

  def index
    @pets = Pet.all
    @lost = Pet.lost.last(5)
    @found = Pet.found.last(5)
  end
end
