require 'date'

input = File.readlines('input.txt')

LogLine = Struct.new(:datetime, :event)

log = input.map { |line|
    split_line = line.split(' ')
    datetime = DateTime.parse("#{split_line[0].delete_prefix('[')} #{split_line[1].chomp(']')}")
    LogLine.new(datetime, split_line[2..split_line.length].join(' '))
}.sort {
    |x,y| x.datetime <=> y.datetime
}

$current_guard = nil
$current_start = nil
$guards_with_ranges = {}
for log_line_index in 0...(log.length) do
    log_line = log[log_line_index]
    if log_line.event.start_with?("Guard")
        $current_guard = log_line.event.scan(/#([0-9]*)/)
    end
    if (log_line.event.start_with?("falls"))
        $current_start = log_line.datetime
    end
    if (log_line.event.start_with?("wakes"))
        if ($guards_with_ranges[$current_guard] == nil)
            $guards_with_ranges[$current_guard] = []
        end
        range = ($current_start.minute)...(log_line.datetime.minute)
        $guards_with_ranges[$current_guard] << range
    end
end

$guards_with_minutes = {}
$guards_with_ranges.each { |guard, ranges|
    ranges.each { |cur_range|
        for minute in cur_range do
            if ($guards_with_minutes[guard] == nil)
                $guards_with_minutes[guard] = {}
            end
            if ($guards_with_minutes[guard][minute] == nil)
                $guards_with_minutes[guard][minute] = 0
            end
            $guards_with_minutes[guard][minute] = ($guards_with_minutes[guard][minute] + 1)
        end
    }
}

$guards_with_max_minute = {}

$max_guard = $guards_with_minutes.max_by { |k,v|
    v.map {|k2,v2| v2}.reduce(:+)
}

max_guard = nil
max_minute = -1
max_occurences = 0
$guards_with_minutes.each { |guard, minute_hash|
    minute_hash.each {|minute, occurences|
        if (occurences > max_occurences)
            max_minute = minute
            max_occurences = occurences
            max_guard = guard
        end
    }
}
puts "#{max_guard} #{max_minute}"