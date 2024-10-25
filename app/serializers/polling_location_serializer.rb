class PollingLocationSerializer < ActiveModel::Serializer
  attributes :title, :address, :city, :postal_code

  belongs_to :riding, serializer: RidingSerializer
  has_many :polls, serializer: PollSerializer
end
