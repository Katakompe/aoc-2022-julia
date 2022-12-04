module Day4

include("../Imports.jl")
using .Imports


function part1(file)

    function is_contained(elf_pair)
        elf_1 = sign(elf_pair[2].lower - elf_pair[1].lower) 
        elf_2 = sign(elf_pair[2].upper - elf_pair[1].upper)
        return elf_1 != elf_2 || (elf_1 == 0 && elf_2 == 0)
    end

    sectors_by_elf_pair = list_of_strings_2d(file, "\n", ",")
    sectors_by_elf_pair = map(collect,  sectors_by_elf_pair)
    sectors_by_elf_pair = map(elf_pair -> map(sectors -> (lower = parse(Int64, split(sectors, "-")[1]), upper = parse(Int64, split(sectors, "-")[2])), elf_pair),  sectors_by_elf_pair)
    num_pairs = filter(is_contained, sectors_by_elf_pair)
    return length(num_pairs)
end


function part2(file)

    function is_contained(elf_pair)
        elf_1 = sign(elf_pair[2].lower - elf_pair[1].upper) 
        elf_2 = sign(elf_pair[2].upper - elf_pair[1].lower)
        return elf_1 != elf_2 || (elf_1 == 0 && elf_2 == 0)
    end

    sectors_by_elf_pair = list_of_strings_2d(file, "\n", ",")
    sectors_by_elf_pair = map(collect,  sectors_by_elf_pair)
    sectors_by_elf_pair = map(elf_pair -> map(sectors -> (lower = parse(Int64, split(sectors, "-")[1]), upper = parse(Int64, split(sectors, "-")[2])), elf_pair),  sectors_by_elf_pair)
    num_pairs = filter(is_contained, sectors_by_elf_pair)
    return length(num_pairs)
end

export part1
export part2
end
