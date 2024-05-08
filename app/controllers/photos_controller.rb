class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photo_templates/index" })
  end

  def show
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id })
    @the_photo = matching_photos.first
    render ({ :template => "photo_templates/show" })
  end

  def baii
    the_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.first
    the_photo.destroy

    redirect_to("/photos")
  end

  def create
    new_photo = Photo.new
    new_photo.image = params.fetch("query_image")
    new_photo.caption = params.fetch("query_caption")
    new_photo.owner_id = params.fetch("query_owner_id")
    new_photo.save
   # render({:template => "photo_templates/create"})
   redirect_to("/photos/" + new_photo.id.to_s )

  end

  def update
    photo_id = params.fetch("photo_id")
    input_caption = params.fetch("input_caption")
    input_image = params.fetch("input_image")

    matching_photos = Photo.where({ :id => photo_id })
    the_photo = matching_photos.first
    the_photo.image = input_image
    the_photo.caption = input_caption 
    the_photo.save

    redirect_to("/photos/" + photo_id.to_s)
  end

  def comment
    photo_id = params.fetch("photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_body")

    new_comment = Comment.new
    new_comment.photo_id = photo_id
    new_comment.author_id = input_author_id
    new_comment.body = input_body
    new_comment.save

    redirect_to("/photos/" + photo_id.to_s)
  end


end
