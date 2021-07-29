class StoriesController < ApplicationController
    
    def index
        @stories = Story.most_recent
        if !logged_in?
            redirect_to '/'
        else
            @user = current_user
        end
    end

    def new 
        @story = Story.new
    end

    def create
        @story = current_user.stories.build(story_params)
        
        if @story.save
          redirect_to @story
        else
          render '/stories/new'
        end
    end

    def show
        @story = Story.find_by_id(params[:id])
        @contributions = @story.contributions.all
        @contribution = Contribution.new
    end

    def edit 
        @story = Story.find(params[:id])
    end

    def update 
        @story = Story.find(params[:id])
        if @story.update(story_params)
            redirect_to @story
        else
            render :edit
        end
    end 

    def destroy
        # @story = Story.find(params[:id])
        # @story.destroy
        # flash[:notice] = "Story deleted."
        # redirect_to stories_path
        session.delete(:user_id)
        redirect_to '/'
    end

    private

    def story_params
        params.require(:story).permit(:hook)
    end

end
