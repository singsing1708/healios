class CreateUrlMappingClick < ActiveInteraction::Base

  integer :url_mapping_id, default: nil

  def to_model
    UrlMappingClick.new
  end

  def execute
    url_mapping_click = UrlMappingClick.new(inputs)

    unless url_mapping_click.save
      errors.merge!(url_mapping_click.errors)
    end
    url_mapping_click
  end

end
