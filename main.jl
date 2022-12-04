include("./day-1/Day1.jl")
include("./day-2/Day2.jl")
include("./day-3/Day3.jl")
include("./day-4/Day4.jl")


day1Part1 = Day1.part1("./day-1/input.txt")
println("Result Day 1-1: $(day1Part1)")
day1Part2 = Day1.part2("./day-1/input.txt")
println("Result Day 1-2: $(day1Part2)")
println("")

day2Part1 = Day2.part1("./day-2/input.txt")
println("Result Day 2-1: $(day2Part1)")
day2Part2 = Day2.part2("./day-2/input.txt")
println("Result Day 2-2: $(day2Part2)")
println("")

day3Part1 = Day3.part1("./day-3/input.txt")
println("Result Day 3-1: $(day3Part1)")
day3Part2 = Day3.part2("./day-3/input.txt")
println("Result Day 3-2: $(day3Part2)")
println("")

day4Part1 = Day4.part1("./day-4/input.txt")
println("Result Day 4-1: $(day4Part1)")
day4Part2 = Day4.part2("./day-4/input.txt")
println("Result Day 4-2: $(day4Part2)")
println("")