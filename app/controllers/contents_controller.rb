class ContentsController < ApplicationController
	require 'will_paginate/array'
	def index
		@contents = Content.all.order(updated_at: :desc).paginate(page: params[:page],per_page: 4)
	end
	def sortlike
		if user_signed_in?
		@contents = Content.all.sort_by{|likes| likes.totallike}.reverse.paginate(page: params[:page],per_page: 4)
	    else
		redirect_to contents_path
	    end
	end

	def show
		if user_signed_in?
		@content = Content.find(params[:id])
		else
		redirect_to contents_path
	    end
	end
	def new
		if user_signed_in?
		@content = Content.new
	else
		redirect_to contents_path
		end
	end
	def create
		@content = Content.new(content_params)
		@content.user = current_user

			if @content.save
				redirect_to contents_path
			else
				render :new
			end
			
	end
	def like
		if user_signed_in?
				@content=Content.find(params[:id])
				like=Like.create(like: params[:like],user: current_user, content: @content)
				
		        if like.valid?
				   flash[:success] = "your selection was succesfull"
				   redirect_back fallback_location: content_path(@content)
		 else
				    flash[:danger] = "you can only like or dislike once"
				    redirect_back fallback_location: content_path(@content)
		       end
		       else
		redirect_to new_user_session_path
	    end

	end

	def edit
		if user_signed_in?
		@content= Content.find(params[:id])
		if current_user != @content.user
			redirect_to contents_path
		end
		else
		redirect_to contents_path
	    end

	end
	def update
		
		@content= Content.find(params[:id])
		if @content.update(content_params)
				redirect_to content_path(@content)
			else
				render :edit
			end
	
	end
	private 
	def content_params
		params.require(:content).permit(:name, :summary,:description,:picture)

	end
	
end
