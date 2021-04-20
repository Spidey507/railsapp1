class Comment < ApplicationRecord

  belongs_to :article
  belongs_to :user

  def set_commenter
    update(commenter: user.username)
  end
end
