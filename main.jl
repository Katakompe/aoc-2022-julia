include("./Imports.jl")
using .Imports

solved_days= [1,2,3,4,5,6]
for day in solved_days
    include("./day-$day/Day$day.jl")
end


function runDay(
        day,
        part1_fn,
        part2_fn,
        input1_transform = str::String -> str,
        input2_transform = str::String -> str
    )
    input_path = "./day-$day/input.txt"
    f = open(input_path)
    raw_input = read(f, String)
    input = input1_transform(raw_input)
    #part 1
    part1 =part1_fn(input)
    println("Result Day $day-1: $(part1)")
    duration1 = @elapsed part1_fn(input)
    println("Duration for part1: $(round(duration1*1000000, digits=1)) μs")
    @time part1_fn(input)

    #part2
    input = input2_transform(raw_input)
    part2 =  part2_fn(input)
    println("Result Day $day-2: $(part2)")
    duration2 = @elapsed part2_fn(input)
    println("Duration for part2: $(round(duration2*1000000, digits=1)) μs")
    @time part2_fn(input)

    println("")
    close(f)
end

runDay(
    1,
    Day1.part1,
    Day1.part2,
    str -> list_of_type_2d(str, Int, "\n\n", "\n"),
    str -> list_of_type_2d(str, Int, "\n\n", "\n")
    )

runDay(
    2,
    Day2.part1,
    Day2.part2,
    list_of_strings,
    list_of_strings
)

runDay(
    3,
    Day3.part1,
    Day3.part2,
    list_of_strings,
    list_of_strings
    )

runDay(
    4,
    Day4.part1,
    Day4.part2,
    str -> list_of_strings_2d(str, "\n", ","),
    str -> list_of_strings_2d(str, "\n", ",")
    )

runDay(
    5,
    Day5.part1,
    Day5.part2
    )

    runDay(
        6,
        Day6.part1,
        Day6.part2
        )

#=

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

day5Part1 = Day5.part1("./day-5/input.txt")
println("Result Day 5-1: $(day5Part1)")
day5Part2 = Day5.part2("./day-5/input.txt")
println("Result Day 5-2: $(day5Part2)")
println("")
=#