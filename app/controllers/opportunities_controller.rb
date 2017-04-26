class OpportunitiesController < ApplicationController

	layout 'application_no_container', only: [:show]

	before_action :authenticate, except: [:show]
	before_action :set_opportunity, only: [:show, :edit, :update, :destroy]

	# GET /opportunities
	# GET /opportunities.json
	def index
		@opportunities = Opportunity.all
	end

	# GET /opportunities/1
	# GET /opportunities/1.json
	def show
		begin
			@quiz = Quiz.new JSON.parse(session[:quiz])
		rescue
			# redirect_to @opportunity.link if @opportunity.link.present? && params[:follow].present?
			redirect_to root_url
		end

		@other_opps = @quiz.results(@opportunity.id).take(3).map{ |r| "#{r.name}" }.join(", ")
		@results_str = Base64.encode64 @quiz.questions.to_json
	end

	# GET /opportunities/new
	def new
		@opportunity = Opportunity.new
	end

	# GET /opportunities/1/edit
	def edit
	end

	# POST /opportunities
	# POST /opportunities.json
	def create
		@opportunity = Opportunity.new(opportunity_params)

		respond_to do |format|
			if @opportunity.save
				format.html { redirect_to @opportunity, notice: 'Opportunity was successfully created.' }
				format.json { render :show, status: :created, location: @opportunity }
			else
				format.html { render :new }
				format.json { render json: @opportunity.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /opportunities/1
	# PATCH/PUT /opportunities/1.json
	def update
		respond_to do |format|
			if @opportunity.update(opportunity_params)
				format.html { redirect_to @opportunity, notice: 'Opportunity was successfully updated.' }
				format.json { render :show, status: :ok, location: @opportunity }
			else
				format.html { render :edit }
				format.json { render json: @opportunity.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /opportunities/1
	# DELETE /opportunities/1.json
	def destroy
		@opportunity.destroy
		respond_to do |format|
			format.html { redirect_to opportunities_url, notice: 'Opportunity was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_opportunity
		@opportunity = Opportunity.friendly.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def opportunity_params
		params.require(:opportunity).permit(:name, :link, :image_src, :blurb)
	end
end
