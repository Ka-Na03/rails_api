class Article < ApplicationRecord
  before_validation :generate_slug

  validates :slug, presence: true, uniqueness: true

  private

  def generate_slug
    self.slug = title.parameterize if title
  end
end
