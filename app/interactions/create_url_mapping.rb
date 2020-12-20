class CreateUrlMapping < ActiveInteraction::Base

  integer :user_id, default: nil

  string :original_url, default: nil

  validates :original_url, :user_id, presence: true

  def to_model
    UrlMapping.new
  end

  def execute
    url_mapping = UrlMapping.new(create_params)

    unless url_mapping.save
      errors.merge!(url_mapping.errors)
    end
    url_mapping
  end


  private

  def generate_hashed_path
    loop do
      hashed_path = SecureRandom.alphanumeric(7)
      break hashed_path unless UrlMapping.exists?(hashed_path: hashed_path)
    end
  end

  def create_params
    { user_id: user_id, original_url: update_original_url, hashed_path: generate_hashed_path }
  end

  def update_original_url
    (original_url.start_with?("http://") || original_url.start_with?("https://"))? original_url : "http://#{original_url}"
  end
end
