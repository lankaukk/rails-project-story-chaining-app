class ContributionsController < ApplicationController

    def new 

    end

    def create
      contribution = Contribution.create(contribution_params)
      redirect_to story_url(:id)
    end
  
    private
  
    def contribution_params
      params.require(:contribution).permit(:body)
    #   , :story_id, :user_id, user_attributes:[:first_name][:last_name])
    end
end
