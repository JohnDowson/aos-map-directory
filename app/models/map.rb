class Map < ApplicationRecord
  validates :file, presence: true
  validates :name, presence: true, uniqueness: true

  has_one_attached :file
  has_one :preview
  has_many :taggings
  has_many :tags, through: :taggings
  
  def self.search(searchterm)
    if searchterm != ""
      where name: searchterm
    else
      all
    end
  end

  def self.find_by_tag(tagname)
    tag = Tag.find_by name: tagname
    return tag.maps if tag
    []
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def tag_list_add(tag)
    self.tags << Tag.where(name: tag).first_or_create!
  end

end
