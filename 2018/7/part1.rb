load 'common.rb'

$result = ""
def doit(step, candidates)

    if (candidates == nil || candidates.length == 0)
        return
    end
    $result += step.first[0]

    step.first[1].dependent.each { |dep| candidates[dep] = $steps[dep] }

    candidates.delete(step.first[0])

    next_candidates = candidates.select { |_, constraints| constraints.prerequisites.all? { |prereq| $result.include?(prereq) } }.sort.uniq

    puts "(#{step.first[0]}) next= #{candidates.map {|c| c[0]}}"
    if (next_candidates.first == nil)
        return ""
    end
    return doit([next_candidates.first].to_h, candidates.uniq.to_h)
end

candidates = $steps.select {|_,constraints| constraints.prerequisites.length == 0}

head = [(candidates.sort.first)].to_h
candidates.delete(head)
doit(head, candidates)
puts $result