class Ab
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_code,:former_area_id,:city,:address,:building,:tel, :buyer ,:token

  # ここにバリデーションの処理を書く
  with_options presence: true do

    validates :user_id
    validates :item_id

    validates :former_area_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 47 }
    validates :city
    validates :address
    validates :tel, format: {with: /\A\d{10,11}\z/}
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  end


  def save
  # 寄付情報を保存し、変数donationに代入する
  buyer = Buyer.create(user_id: user_id, item_id: item_id)
  # 住所を保存する
  # donation_idには、変数donationのidと指定する
  Adrressse.create(post_code: post_code,former_area_id: former_area_id, city: city, address: address, building: building, tel: tel, buyer: buyer)
  end
end