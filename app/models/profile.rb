class Profile < ActiveRecord::Base
  belongs_to :user
  validate :either_first_or_last_name_can_be_null_but_not_both
  validate :must_be_male_or_female
  validate :not_johnny_cash


  def either_first_or_last_name_can_be_null_but_not_both
  	if first_name == nil && last_name == nil
  		errors.add(:last_name, "both first and last name cannot be null.")
  	end
  end

  def must_be_male_or_female
  	if gender != 'male' && gender != 'female'
  		errors.add(:gender, "gender must be either male or female.")
  	end
  end

  def not_johnny_cash
  	if first_name == "Sue" && gender == 'male'
  		errors.add(:first_name, "Don't name your boy Sue.")
  	end
  end

  	def self.get_all_profiles(min_birth_year, max_birth_year)
		Profile.where("birth_year between ? and ?", min_birth_year, max_birth_year).order(birth_year: :asc).to_a
	end
end
