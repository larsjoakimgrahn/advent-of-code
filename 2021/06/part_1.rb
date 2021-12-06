$data = File.readlines('input.txt')[0].split(',').map(&:to_i).each_with_object(Hash.new(0)) { |e, h| h[e] += 1; }

(1..256).each do |_day|
  newData = {}
  $data.each do |value, count|
    newValue = value - 1
    if newValue < 0
      newData[6] = 0 if newData[6].nil?
      newData[6] += count
      newData[8] = 0 if newData[8].nil?
      newData[8] += count
    else
      newData[newValue] = 0 if newData[newValue].nil?
      newData[newValue] += count
    end
  end
  $data = newData
end
p $data
p $data.values.inject { |a, b| a + b }
