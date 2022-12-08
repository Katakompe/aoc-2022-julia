module Day7

include("../Imports.jl")
using .Imports
using DataStructures

function updateFileSize(dirs::Dict{String, Int64}, open_dirs::Deque{String}, filesize::Int64)
    for open_dir in open_dirs
        haskey(dirs, open_dir) ? dirs[open_dir]= dirs[open_dir] + filesize : dirs[open_dir]=filesize 
    end
end


function part1(command_groups::Vector{Vector{SubString{String}}})
    command_groups = command_groups[2:end]
    dirs = Dict{String, Int64}()

    open_dirs::Deque{String} = Deque{String}()
    for command_group in command_groups
        command = command_group[1]
        tabs = join(["\t" for t in 1:length(open_dirs)])
        #cd 
        if startswith(command, "cd")
            if command == "cd .."
                pop!(open_dirs)
            else 
                push!(open_dirs, "$(command[4:end]) $(join(open_dirs))")
            end
        end
        #ls
        if startswith(command, "ls")
            __ = [d[5:end] for d in command_group[2:end] if startswith(d, "dir")]        
            files = [split(f, " ") for f in command_group[2:end] if !startswith(f, "dir") && f!=""]        
            total_file_size = length(files) > 0 ? sum([parse(Int64, f[1]) for f in files]) : 0
            for f in files
            end
            updateFileSize(dirs, open_dirs, total_file_size)
        end
    end
    return sum([pair[2] for pair in pairs(dirs) if pair[2] <= 100000])
end

#best: 644.6 μs
function part2(command_groups::Vector{Vector{SubString{String}}})
    command_groups = command_groups[2:end]
    dirs = Dict{String, Int64}()

    open_dirs::Deque{String} = Deque{String}()
    for command_group in command_groups
        command = command_group[1]
        #cd 
        if startswith(command, "cd")
            if command == "cd .."
                pop!(open_dirs)
            else 
                push!(open_dirs, "$(command[4:end])$(join(open_dirs))")
            end
        end
        #ls
        if startswith(command, "ls")
            __ = [d[5:end] for d in command_group[2:end] if startswith(d, "dir")]        
            files = [split(f, " ") for f in command_group[2:end] if !startswith(f, "dir") && f!=""]        
            total_file_size = length(files) > 0 ? sum([parse(Int64, f[1]) for f in files]) : 0
            for f in files
            end
            updateFileSize(dirs, open_dirs, total_file_size)
        end
    end
    
    free_space = 70000000 - dirs["/"]
    required_space = 30000000 - free_space
    return sort([pair[2] for pair in pairs(dirs) if pair[2] >= required_space])[1]
end


export part1
export part2

end
