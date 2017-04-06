class User < ApplicationRecord
has_manay :activities
has_manay :user_acitivities
end
