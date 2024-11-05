class ActorsController < ApplicationController
  def update
    a_id = params.fetch("the_id")

    matching_records = Actor.where({ :id => a_id})
    the_actor = matching_records.at(0)

    the_actor.title = params.fetch("the_title")
    the_actor.year = params.fetch("the_year")
    the_actor.duration = params.fetch("the_duration")
    the_actor.description = params.fetch("the_description")
    the_actor.image = params.fetch("the_image")
    the_actor.id = params.fetch("the_actor_id")

    the_actor.save

    redirect_to("/actors/#{the_actor.id}")
  end

  def create
    a = Actor.new
    
    a.title = params.fetch("the_title")
    a.year = params.fetch("the_year")
    a.duration = params.fetch("the_duration")
    a.description = params.fetch("the_description")
    a.image = params.fetch("the_image")
    a.director_id = params.fetch("the_actor_id")

    a.save

    redirect_to("/actors")
  end 


  def destroy
    the_id = params.fetch("an_id")

    matching_records = Actor.where({:id => the_id})

    the_actor = matching_records.at(0)

    the_actor.destroy

    redirect_to("/actors")
  end 

  #PREVIOUSSTUFF
  
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
