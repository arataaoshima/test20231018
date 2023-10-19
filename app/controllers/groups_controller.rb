class GroupsController < ApplicationController

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            redirect_to groups_path
        else
            render 'new'
        end
    end

    def show
    end

    def index
        @groups = Group.all
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
        def group_params
            params.require(:group).permit(:group_name)
        end

end