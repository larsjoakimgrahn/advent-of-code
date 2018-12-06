load 'common.rb'

loc_to_coord_distance = Hash.new { |h, k| h[k] = {} }

$x_range.each do |x|
    $y_range.each do |y|
        location = Point.new(x,y)
        $coords.each do |coordinate|
            loc_to_coord_distance[location][coordinate] = manhattan_distance(coordinate, location)
        end
    end
end

closest_coords = [], infinite = []
loc_to_coord_distance.each do |location, coord_list|
    min_coord = nil, min_dist = nil
    coord_list.each do |coord, dist|
        if (min_dist == nil || dist < min_dist)
            min_dist = dist
            min_coord = coord
        elsif (dist == min_dist)
            min_coord = nil
        end
    end

    if (infinite?(location))
        infinite << min_coord
        next
    end

    closest_coords << min_coord unless min_coord == nil
end
freq = closest_coords.select { |p| !infinite.include?(p) }.inject(Hash.new(0)) { |h,v| h[v] += 1; h }.max_by { |_, v| v }
puts "freq = #{freq}"