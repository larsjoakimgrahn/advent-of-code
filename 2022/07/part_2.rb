Directory = Struct.new(:name, :parent, :children, :size)
FFile = Struct.new(:name, :size)

$input = File.readlines('input.txt').map {|line| line.gsub("\n",'') }
$root, *$rest = $input

$root_directory = Directory.new($root.split(' ')[2], nil, [])
$current_directory = $root_directory

$rest.each {|line|
  if line == "$ cd .."
    $current_directory = $current_directory.parent
  elsif line.start_with?("$ cd")
    directory_name = line.split(' ')[2]
    $current_directory = $current_directory.children.find {|child| child.is_a?(Directory) && child.name == directory_name}
  elsif line.start_with?("ls")
    # NOP
  elsif line.start_with?("dir")
    $current_directory.children.push(Directory.new(line.split(' ')[1], $current_directory, []))
  else
    $current_directory.children.push(FFile.new(line.split(' ')[1], line.split(' ')[0].to_i))
  end
}

$dirs = []
$total_disk_space = 70000000
$required_space = 30000000
def size_of(directory) 
  size = 0
  directory.children.each { |child|
    if child.is_a? Directory then
      size += size_of(child)
    elsif child.is_a? FFile then
      size += child.size
    end
  }
  directory.size = size
  $dirs.push(directory)
  return size
end

$total_used_space = size_of $root_directory

$available_space = $total_disk_space - $total_used_space
$should_be_freed = $required_space - $available_space

$dir_to_be_deleted = $dirs.sort_by {|dir| dir.size}.find {|dir| dir.size > $should_be_freed}
puts "#{$dir_to_be_deleted.name} => #{$dir_to_be_deleted.size}"