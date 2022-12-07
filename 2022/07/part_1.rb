Directory = Struct.new(:name, :parent, :children)
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

$size_of_small_dirs = 0
def size_of(directory) 
  size = 0
  directory.children.each { |child|
    if child.is_a? Directory then
      size += size_of(child)
    elsif child.is_a? FFile then
      size += child.size
    end
  }
  $size_of_small_dirs += size unless size >= 100_000
  return size
end

size_of $root_directory

puts $size_of_small_dirs