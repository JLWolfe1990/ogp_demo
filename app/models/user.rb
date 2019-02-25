class User < ApplicationRecord
  def first_name
    return nil unless full_name.present?

    full_name.split(" ").first
  end
end
