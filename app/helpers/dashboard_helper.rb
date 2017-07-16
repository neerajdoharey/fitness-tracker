module DashboardHelper
  def weight_change(body_stats)
    last_weight = body_stats[-1].weight
    second_last_weight = body_stats[-2].weight
    weight_diff =  last_weight - second_last_weight
    unit = weight_unit
    arrow = ""
    if weight_diff > 0
      arrow = "up green"
    elsif weight_diff < 0
      arrow = "down red"
    end

    days_diff = body_stats[-1].created_at.to_date - body_stats[-2].created_at.to_date
    tag_generator("weight", last_weight, second_last_weight, weight_diff, arrow, days_diff, unit, body_stats[-1].created_at)
  end

  def bodyfat_change(body_stats)
    if !body_stats.empty? && body_stats.length > 1
      last_body_fat = body_stats[-1].body_fat
      second_body_fat = body_stats[-2].body_fat
      body_fat_diff =  last_body_fat - second_body_fat
      unit = "%"
      arrow = ""
      if body_fat_diff > 0
        arrow = "up green"
      elsif body_fat_diff < 0
        arrow = "down red"
      end
      days_diff = body_stats[-1].created_at.to_date - body_stats[-2].created_at.to_date
      tag_generator("body_fat", last_body_fat, second_body_fat, body_fat_diff, arrow, days_diff, unit, body_stats[-1].created_at)
    else
      return "-"
    end
  end

  def tag_generator(image, last, second_last, differece, arrow, days_diff, unit, stat_date)
    content_tag(:div, class: 'row') do
      concat(content_tag(:div, image_tag("#{image}.jpg", alt: "#{image}", size: "80x80" ) ,class: 'col-md-3'))
      concat(content_tag(:div, class: 'col-md-9') do
        concat(content_tag(:p, "#{image.gsub(/\_/,' ').upcase} CHANGE: #{stat_date.strftime('%d %b %Y')}",class: 'title-description'))
        concat(content_tag(:h5, class: 'top_mar_20px') do
          concat("#{last}  #{unit}")
           concat(content_tag(:div,class: "arrowContainer #{arrow}") do
             if differece == 0
               content_tag(:i ,class: 'fa fa-arrows-h 2x') do

               end
             else
               content_tag(:div)
             end
           end)
           concat(" #{differece.abs} #{unit}")
        end)
        concat(content_tag(:p) do
          content_tag(:small, "#{current_user.full_name} updated #{current_user.user_profile.gender == 'Male'? 'his' : 'her'} #{image.gsub(/\_/,' ')} from  #{second_last}#{unit} to #{last}#{unit}, a #{differece.abs}#{unit} #{ differece > 0 ? 'gain' : 'loss' } in #{days_diff.to_i} days.")
        end)
      end)
    end
  end
end
