Publisher.create!(name: "NXB Kim Đồng", logo: "/images/publishers/kimdong.png")
Publisher.create!(name: "NXB Trẻ", logo: "/images/publishers/nxb_tre.png")
Publisher.create!(name: "TVM Comics", logo: "/images/publishers/tvm.jpg")
Publisher.create!(name: "TABooks", logo: "/images/publishers/tabooks.png")
Publisher.create!(name: "NXB Hồng Đức", logo: "/images/publishers/hongduc.png")
Publisher.create!(name: "NXB Thanh Niên", logo: "/images/publishers/thanh_nien.png")
Publisher.create!(name: "IMP", logo: "/images/publishers/ipm.png")

# movies = Movie.all
# users = User.all

# ActiveRecord::Base.transaction do
#   movies.each do |movie|
#     users.each do |user|
#       RateHistory.create!(
#         user_id: user.id,
#         movie_id: movie.id,
#         rate_type: [0, 1].sample,
#       )
#     end

#     movie.update_counter!
#   end
# end
