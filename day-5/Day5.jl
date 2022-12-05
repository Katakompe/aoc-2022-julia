module Day5

include("../Imports.jl")
using .Imports

using DataStructures


function parse_towers(towers_str::SubString{String})
    tower_lines = split(towers_str, "\n")
    actual_tower_lines = filter(line -> line[1:2] != " 1", tower_lines)
    cleaned_lines = map(l -> collect(l[2:4:end]), actual_tower_lines)
    tower_matrix = permutedims(hcat(cleaned_lines...)[:, end:-1:1])
    
    stacks = []
    for t in eachcol(tower_matrix)
        stack = Stack{Char}()
        for crate in t
            if crate != ' '
                push!(stack, crate)
            end
        end
        push!(stacks, stack)
    end
    return stacks
end

function parse_moves(moves_str::SubString{String})
    move_regex = r"move (\d+) from (\d+) to (\d+)"
    moves = [parse.(Int, match(move_regex, s).captures) for s in split(moves_str, "\n")]
    moves_tuples = [(count = m[1], from = m[2], to = m[3]) for m in moves]
    return moves_tuples
end

function parse_input(input_str::String)
    split_input = split(input_str, "\n\n")
    towers_str = split_input[1]
    moves_str = split_input[2]
    towers = parse_towers(towers_str)
    moves = parse_moves(moves_str)

    return (towers = towers, moves = moves)
end

function part1(str::String)
    (towers, moves) = parse_input(str)
    for move in moves
        temp = []
        for i in 1:move.count
            push!(temp, pop!(towers[move.from]))
        end
        for i in temp
            push!(towers[move.to], i)
        end        
    end
    return join([pop!(t) for t in towers], "")
end


function part2(str::String)
    (towers, moves) = parse_input(str)
    for move in moves
        temp = []
        for i in 1:move.count
            push!(temp, pop!(towers[move.from]))
        end
        reverse!(temp)
        for i in temp
            push!(towers[move.to], i)
        end        
    end
    return join([pop!(t) for t in towers], "")
end

export part1
export part2
end
