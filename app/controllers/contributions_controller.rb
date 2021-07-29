class ContributionsController < ApplicationController

    def index
      @contributions = Contribution.all
    end

    def new 
      @contribution = Contribution.new
      @story = Story.find_by_id(params[:story_id])
      @contributions = @story.contributions.all
    end

    def create
    @contribution = current_user.contributions.build(contribution_params)
      if !@contribution.save
        flash.alert = "Didn't work."
      end
      redirect_to @contribution.story
    end
  
    private
  
    def contribution_params
      params.require(:contribution).permit(:body, :story_id)
    #   , :story_id, :user_id, user_attributes:[:first_name][:last_name])
    end
end
