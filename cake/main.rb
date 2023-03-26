def slice_cake(cake)
  num_of_raisins = cake.join("").count("o")

  if num_of_raisins <= 1
    return [cake]
  end
  
  height = cake.length
  width = cake[0].length

  cuts = []
  for cut_width in 1..width
    for cut_height in 1..height
      if width % cut_width == 0 && height % cut_height == 0
        piece_width = width / cut_width
        piece_height = height / cut_height
        pieces = Array.new(cut_height) { Array.new(cut_width, "") }
        raisins_left = num_of_raisins
        
        for y in 0...cut_height
          for x in 0...cut_width
            piece_raisins = 0
            for i in 0...piece_height
              for j in 0...piece_width
                if cake[y*piece_height+i][x*piece_width+j] == "o"
                  piece_raisins += 1
                end
              end
            end
            if piece_raisins == 0
              raisins_left = nil
              break
            end
            if piece_raisins > 1
              raisins_left = nil
              break
            end
            pieces[y][x] = cake[(y*piece_height)...((y+1)*piece_height)].map { |row| row[(x*piece_width)...((x+1)*piece_width)] }.flatten.join
            raisins_left -= 1
          end
          if raisins_left == nil
            break
          end
        end
        if raisins_left == 0
          cuts << pieces
        end
      end
    end
  end

  return cuts[0]
end

# Пример использования
cake = [
  ".o......",
  "......o.",
  "....o...",
  "..o.....",
]

result = slice_cake(cake)
if result != nil
  puts result.inspect
else
  puts "Нет решения"
end
