class NorisController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
    def index
        @noris = Nori.all 
        if params[:search] != nil && params[:search] != ''
          #部分検索かつ複数検索
          search = params[:search]
          @noris = Nori.where("shop_name LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%")
        else
          @noris = Nori.all
        end
  
  
        if params[:tag_ids]
        @noris = []
        params[:tag_ids].each do |key, value|      
          @noris += Tag.find_by(name: key).noris if value == "1"
        end
        @noris.uniq!
      end
  
    end
    def new
        @nori = Nori.new
      end
    
      def create
        nori = Nori.new(nori_params)
        nori.user_id = current_user.id
      
        if nori.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def show
        @nori = Nori.find(params[:id])
        @comments = @nori.comments
        @comment = Comment.new
      end
      def edit
        @nori = Nori.find(params[:id])
      end
      
      def update
        nori = Nori.find(params[:id])
        if nori.update(nori_params)
          redirect_to :action => "show", :id => nori.id
        else
          redirect_to :action => "new"
        end
      end
      def destroy
        nori = Nori.find(params[:id])
        nori.destroy
        redirect_to action: :index
      end
    
    
      private
      def nori_params
          params.require(:nori).permit(:address, :shop_name, :price, :name, :about, :image, :hoshi, :lat, :lng ,tag_ids: [])
      end
end
