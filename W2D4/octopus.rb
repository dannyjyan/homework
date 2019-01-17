def sluggish_octopus(arr)
    arr.each do |fish|
        is_longest = true 
        arr.each do |other|
            is_longest = false if fish.length < other.length 
        end 
        return fish if is_longest
    end
end 

def dominant_octopus(array)
    merge_sort(array) {|fish2, fish1| fish1.length <=> fish2.length} [0]
end 

  # Merge Sort: O(n*lg(n))
def merge_sort (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
        merge_sort(array.take(mid_idx), &prc),
        merge_sort(array.drop(mid_idx), &prc),
        &prc)
end

  # NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
  def merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end

  def clever_octopus(array)
    largest_fish = array[1]
    largest_len = largest_fish.length 
    (1...array.length).each do |i|
        if array[i].length > largest_len
            largest_len = array[i].length 
            largest_fish = array[i]
        end 
    end 
    largest_fish
  end

# DDR Octo 

  def slow_dance(dir, tiles_array)
    tiles_array.each_with_index {|el,i| return i if el == dir }
  end


  def fast_dance(dir, hash)
    hash[dir]
  end 






if __FILE__ == $PROGRAM_NAME
    tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up" ] 
    a = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    new_tiles_data_structure = {"up"=> 0 , "right-up"=> 1, "right"=> 2, "right-down"=> 3, "down"=> 4, "left-down"=> 5, "left"=> 6, "left-up"=> 7 }
    puts sluggish_octopus(a)
    puts dominant_octopus(a)
    puts clever_octopus(a)
    puts slow_dance("up", tiles_array) # 0
    puts slow_dance("right-down", tiles_array) # 3
    puts fast_dance("up", new_tiles_data_structure)
    puts fast_dance("right-down", new_tiles_data_structure)

end