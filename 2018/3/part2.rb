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

def overlaps(claim, other_claim)

    def end_x(claim); (claim.x + claim.width) end
    def end_y(claim); (claim.y + claim.height) end

    if (claim.x > end_x(other_claim) || other_claim.x > end_x(claim))
        return false
    end
    if (claim.y > end_y(other_claim) || other_claim.y > end_y(claim))
        return false
    end

    return true
end

def calculate_for_claim(claim)
    $requested_claims.each { |other_claim|
        if (claim.id == other_claim.id)
            next
        end

        overlaps = overlaps(claim, other_claim)
        if (overlaps)
            return
        end
    }
    puts claim.id
    exit
end

$requested_claims = input.map { |line| create_claim(line) }

$requested_claims.each { |claim|
    calculate_for_claim(claim)
}