include("./Imports.jl")
using .Imports

solved_days= [1,2,3,4,5,6,7,8]
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
    
runDay(
    7,
    Day7.part1,
    Day7.part2,
    str -> list_of_strings_2d(str, "\$ ", "\n"),
    str -> list_of_strings_2d(str, "\$ ", "\n"),
    )

runDay(
    8,
    Day8.part1,
    Day8.part2,
    str -> permutedims(hcat(list_of_type_2d(str, Int, "\n", "")...)),
    str -> permutedims(hcat(list_of_type_2d(str, Int, "\n", "")...)),
    )

