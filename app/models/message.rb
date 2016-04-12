class Message < ActiveRecord::Base
  belongs_to :receiver, class_name: "User"
  belongs_to :sender,   class_name: "User"
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def reply(message)
    m = self.new({body: message})
    m.sender = self.receiver
    m.receiver = self.sender
  end

  def read?
    self.is_read
  end
end
