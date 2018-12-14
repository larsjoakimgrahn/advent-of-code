class Array
    def [](index)
        at(index % self.length)
    end
end

elves_num_recipes = 920831
recipes = [3,7]
elf1_idx, elf2_idx = 0, 1

0..(elves_num_recipes+10).times do |index|
    recipe_sum = recipes[elf1_idx] + recipes[elf2_idx]
    recipes << recipe_sum.to_s[0].to_i
    recipes << recipe_sum.to_s[1].to_i unless recipe_sum.to_s[1] == nil

    elf1_idx += (1 + recipes[elf1_idx])
    elf1_idx = elf1_idx % recipes.length
    elf2_idx += (1 + recipes[elf2_idx])
    elf2_idx = elf2_idx % recipes.length
end
puts "PART1 = #{recipes.slice(elves_num_recipes, 10).join}"