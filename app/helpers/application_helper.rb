module ApplicationHelper
  def highlight_query_results(content, queries)
    if queries.blank?
      return content
    else
      temp = content
      #excerpts
      excerpts_array = []
      content_array = temp
      indices = []

      #configure number of words on either side of query
      either_side_characters = 75
      puts temp
      queries.each do |q|
        temp.to_enum(:scan, /(#{q})/i).map do |m,|
          indices.push [$`.size]
        end
        indices = indices.flatten!
        old_index = -9999

        #check if indices exist
        if indices
          indices.each do |i|
            next if (old_index+either_side_characters) > i
            excerpts_array << "#{temp[start_index(i - either_side_characters).. (i + either_side_characters)]}" if i
            old_index = i
          end
        end
      end

      excerpts = ""

      if !excerpts_array.blank?
        excerpts = excerpts_array.join('.....')
        queries.each do |q|
          excerpts.gsub!(/(#{q})/i, '<mark>\1</mark>')
        end
      end

    end


    return excerpts
  end

  def start_index(val)
    if val < 0
      0
    else
      val
    end

  end
end
