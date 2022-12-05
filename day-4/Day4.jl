module Day4

include("../Imports.jl")
using .Imports


function part1(sectors_by_elf_pair::Vector{Vector{SubString{String}}})

    function is_contained(elf_pair)
        elf_1 = sign(elf_pair[2][1] - elf_pair[1][1]) 
        elf_2 = sign(elf_pair[2][2] - elf_pair[1][2])
        return elf_1 != elf_2 || (elf_1 == 0 && elf_2 == 0)
    end

    sectors_by_elf_pair = collect.(sectors_by_elf_pair)
    sector_tuples = [[Tuple(parse.(Int, split(sectors, "-")))  for sectors in elf_pair] for elf_pair in sectors_by_elf_pair]
    num_pairs = filter(is_contained, sector_tuples)
    return length(num_pairs)
end


function part2(sectors_by_elf_pair::Vector{Vector{SubString{String}}})

    function is_contained(elf_pair)
        elf_1 = sign(elf_pair[2][1] - elf_pair[1][2]) 
        elf_2 = sign(elf_pair[2][2] - elf_pair[1][1])
        return elf_1 != elf_2 || (elf_1 == 0 && elf_2 == 0)
    end

    sectors_by_elf_pair = collect.(sectors_by_elf_pair)
    sector_tuples = [[Tuple(parse.(Int, split(sectors, "-")))  for sectors in elf_pair] for elf_pair in sectors_by_elf_pair]
    num_pairs = filter(is_contained, sector_tuples)
    return length(num_pairs)
end

export part1
export part2
end
