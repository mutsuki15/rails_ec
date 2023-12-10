# frozen_string_literal: true

namespace :promotion_code do
  desc 'プロモーションコードを登録する'
  task generate: :environment do
    10.times do |_n|
      PromotionCode.create(
        code: ('A'..'Z').to_a.sample(7).join,
        discount_amount: 500,
        active: true
      )
    end
  end
end
