class AuthorsController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
  # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessible_entity_response

  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create(author_params)
    render json: author, status: :created
    # render json: { errors: invalid.record.errors.full_message }, status: :unprocessible_entity
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  # def render_unprocessible_entity_response(invalid)
  #   render json: { errors: invalid.record.errors.full_message }, status: :unprocessible_entity
  # end
  
end
