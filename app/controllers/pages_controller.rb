class PagesController < ApplicationController
  def welcome
    @issues = Issue.all.reverse
  end
end
