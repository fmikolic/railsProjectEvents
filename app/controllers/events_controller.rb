class EventsController < ApplicationController
    
    def show
        @event = Event.find(params[:id])
    end

    def index
        @events = Event.all
    end
    

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        respond_to do |format|
            if @event.save
                format.html {redirect_to @event, notice: "Event created!"}
            else
                format.html {render :new, status: :unprocessable_entity}
            end
        end
    end

    #NEED FIX---doesnt work as it should
    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        respond_to do |format|
            format.html { redirect_to events_path, status: :see_other, notice: "Event deleted!" }
            format.json { head:no_content } 
        end
    end

    def edit
        @event = Event.find(params[:id])

    end

    def update
        @event = Event.find(params[:id])

        respond_to do |format|
            if @event.update(event_params)
                format.html {redirect_to @event, notice: "Event created!"}
            else
                format.html {render :edit, status: :unprocessable_entity}
            end
        end
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location)

    end
end
