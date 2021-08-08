class ContributionsController < ApplicationController

    def index
      @contributions = Contribution.all
      # make method to do this
      @story = Story.find_by_id(params[:story_id])
      redirect_to @story
    end

    def new 
      @contribution = Contribution.new
      @story = Story.find_by_id(params[:story_id])
      @contributions = @story.contributions.all
    end

    def create
    @contribution = current_user.contributions.build(contribution_params)
      if !@contribution.save
        flash[:error] = "Contribution must be 6-100 characters."
      end
      redirect_to @contribution.story
    end
  
    private
  
    def contribution_params
      params.require(:contribution).permit(:body, :story_id)
    end
end
