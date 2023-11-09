class PropertyController < ApplicationController
  def index
    @page = params["page"].blank? ? 1 : params["page"].to_i
    limit = 25
    offset = (@page - 1) * limit
    @max_page = (Property.count.to_f / limit.to_f).ceil

    @properties = Property
                    .order(name: :asc)
                    .limit(limit)
                    .offset(offset)
  end

  def show
    @property = Property.find(params[:id])
  end
end
