module ApplicationHelper

   def stars_for(review)
    stars = ""
    review.rating.times do
      stars = stars + '<i class="fa fa-star"></i>'
    end
    stars.html_safe
  end


end
