class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates(:name, :presence => true)
  before_save(:upcase_first_letter_name)

private

  define_method(:upcase_first_letter_name) do
    self.name=(name().capitalize())
  end
end
