input = File.readlines('input.txt')

$overlap_areas = {}
$requested_claims = []

Claim=Struct.new(:id, :x, :y, :width, :height)

def create_claim(line)
    fields=line.split(' ')
    start_point=fields[2].split(',')
    dimensions=fields[3].split('x')
    return Claim.new(fields[0], start_point[0].to_i, start_point[1].chomp(':').to_i, dimensions[0].to_i, dimensions[1].to_i)
end

$requested_claims = input.map { |line| create_claim(line) }

hash = {}
$requested_claims.each { |area|
    for row in (area.x)..(area.x + area.width-1)
        for column in (area.y)..(area.y + area.height-1)
            if hash[[row, column]] == nil
                hash[[row, column]] = 0
            else
                hash[[row, column]] += 1
            end
        end
    end
}
puts hash.select {|key, value| value > 0}.length