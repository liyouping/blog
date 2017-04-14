class User < ApplicationRecord
has_many :activities
has_many :user_acitivities
end
