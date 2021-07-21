class ContributionsController < ApplicationController

    def index
      @contributions = Contribution.all
    end

    def new 
      @contribution = Contribution.new
    end

    def create
      @contribution = current_user.contributions.build(contribution_params)
      
      @contribution.user_id = current_user.id
      
      redirect_to story_url(:id)
    end
  
    private
  
    def contribution_params
      params.require(:contribution).permit(:body)
    #   , :story_id, :user_id, user_attributes:[:first_name][:last_name])
    end
end
