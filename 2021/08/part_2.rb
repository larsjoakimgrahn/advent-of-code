@data = File.readlines('input.txt').map { |l| l.split('|') }

sum = 0
@data.each do |line|
  signal_patterns = line[0].split.map { |p| p.strip.chars.sort.join }
  decoded = {}
  until decoded.length == 10
    signal_patterns.each do |pattern|
      if pattern.length == 2
        decoded[1] = pattern
      elsif pattern.length == 3
        decoded[7] = pattern
      elsif pattern.length == 4
        decoded[4] = pattern
      elsif pattern.length == 7
        decoded[8] = pattern
      elsif pattern.length == 5
        next if decoded[1].nil?

        if pattern.chars.intersection(decoded[1].chars).length == 2
          decoded[3] = pattern
          next
        end

        next if decoded[4].nil?

        if pattern.chars.intersection(decoded[4].chars).length == 2
          decoded[2] = pattern
        else
          decoded[5] = pattern
        end
      elsif pattern.length == 6
        next if decoded[1].nil?

        if pattern.chars.intersection(decoded[1].chars).length == 1
          decoded[6] = pattern
          next
        end

        next if decoded[5].nil?

        newVal = pattern.chars.union(decoded[5].chars).sort.join
        if newVal.length == 7
          decoded[0] = pattern
        else
          decoded[9] = pattern
        end
      end
    end
    p decoded
  end

  outputValues = line[1].strip.split.map { |l| l.strip.chars.sort.join }
  keyToNum = decoded.invert
  sum += outputValues.map { |v| keyToNum[v] || 9 }.map(&:to_s).join.to_i
end
puts sum
