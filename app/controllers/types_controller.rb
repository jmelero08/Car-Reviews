class TypesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        @types = Type.all
    end
end
