module Common
  extend ActiveSupport::Concern

  def overlop_tag
    tag = params[:post][:tags_attributes]['0'][:category]
    Tag.find_by(category: tag)
  end
end
