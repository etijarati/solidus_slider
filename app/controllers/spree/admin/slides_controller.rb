module Spree
  module Admin
    class SlidesController < ResourceController
      respond_to :html

      before_action :set_store

      def index
        @slides = Spree::Slide.order(:position)
      end

      private
        def location_after_save
          admin_store_slides_url(@store)
        end

        def permitted_resource_params
          params
            .require(:slide)
            .permit(:location, :text_url, :link_url, :body, :published, :image)
            .merge(store: @store)
        end

        def set_store
          @store = Spree::Store.find(params[:store_id])
        end

        def collection_url
          admin_store_slides_path(@store)
        end
    end
  end
end
