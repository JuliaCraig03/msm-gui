class DirectorsController < ApplicationController
  def update
    d_id = params.fetch("the_id")

    matching_records = Director.where({ :id => d_id})
    the_director = matching_records.at(0)

    the_director.title = params.fetch("the_title")
    the_director.year = params.fetch("the_year")
    the_director.duration = params.fetch("the_duration")
    the_director.description = params.fetch("the_description")
    the_director.image = params.fetch("the_image")
    the_director.id = params.fetch("the_director_id")

    the_director.save

    redirect_to("/directors/#{the_director.id}")
  end

  def create
    d = Director.new
    
    d.title = params.fetch("the_title")
    d.year = params.fetch("the_year")
    d.duration = params.fetch("the_duration")
    d.description = params.fetch("the_description")
    d.image = params.fetch("the_image")
    d.director_id = params.fetch("the_director_id")

    d.save

    redirect_to("/directors")
  end 


  def destroy
    the_id = params.fetch("an_id")

    matching_records = Movie.where({:id => the_id})

    the_movie = matching_records.at(0)

    the_movie.destroy

    redirect_to("/movies")
  end 
  


#PREVIOUSSTUFF WHICH WAS HERE
  
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end
end
