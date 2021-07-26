class ContributionsController < ApplicationController

    def index
      @contributions = Contribution.all
    end

    def new 
      @contribution = Contribution.new
    end

    def create
      @contribution = current_user.contributions.build(contribution_params)

      if @contribution.save
        redirect_to @contribution.story
      else
        flash[:notice] = "Didn't work."
        redirect_to @contribution.story
      end
    end
  
    private
  
    def contribution_params
      params.require(:contribution).permit(:body, :story_id)
    #   , :story_id, :user_id, user_attributes:[:first_name][:last_name])
    end
end
