class StoriesController < ApplicationController
    
    def index
        @stories = Story.most_recent
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
        @story = Story.find(params[:id])
        @story.destroy
        flash[:notice] = "Story deleted."
        redirect_to stories_path
    end

    private

    def story_params
        params.require(:story).permit(:hook)
    end

end
