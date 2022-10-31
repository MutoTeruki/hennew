class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable
  
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries
  has_many :message, dependent: :destroy
  
  has_many :talks, dependent: :destroy #ユーザーが削除されたら、ツイートも削除
  has_many :likes, dependent: :destroy
  has_many :liked_talks, through: :likes, source: :talk

  has_one :study_record

  def already_liked?(talk)
    self.likes.exists?(talk_id: talk.id)
  end
  has_many :talk_comments, dependent: :destroy

  validates :name, presence: true 
  validates :profile, length: { maximum: 200 }

  has_many :study_records

end
