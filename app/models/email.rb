class Email < ApplicationRecord
  after_create_commit -> { broadcast_prepend_to "emails" }
  after_update_commit -> { broadcast_replace_to "emails" }
  after_destroy_commit -> { broadcast_remove_to "emails" }
end
