module Day07

using AdventOfCode2022

struct FSNode
    files::Vector{Tuple{String, Int}}
    dirs::Dict{String, FSNode}
end
FSNode() = FSNode(Vector{Tuple{String, Int}}(), Dict{String, FSNode}())

pathsep = Sys.iswindows() ? '\\' : '/'
get_files(fs, path::AbstractString) = get_files(fs, split(path, pathsep, keepempty=false))
function get_files(fs, path::Vector)
    isempty(path) ? fs.files : get_files(get!(fs.dirs, first(path), FSNode()), path[2:end])
end

line2file(l) = let n=findfirst(' ', l); (l[n+1:end], parse(Int, l[1:n-1])); end
files(s) = line2file.(filter(x->!isempty(x)&&isnumeric(x[1]), split(s, '\n')))

function assemble_fs(s)
    path = ""
    fs = FSNode()
    for chunk in eachsplit(s, raw"$ cd ", keepempty=false)
        n=findfirst('\n', chunk)
        path = normpath(joinpath(path, chunk[1:n-1]))
        n != length(chunk) && append!(get_files(fs, path), files(chunk[n:end]))
    end
    fs
end

dirsizes(fs::FSNode)::Vector{Int} = let s = dirsizes.(values(fs.dirs))
    push!(vcat(s...), sum(last.(fs.files)) + sum(last.(s)))
end

function day07(input::String = readInput(joinpath(@__DIR__, "data", "day07.txt")))
    sizes = dirsizes(assemble_fs(input))
    [
        sum(filter(x->x<=100000, sizes)), 
        minimum(filter(x->(70000000 - last(sizes)+x)>30000000, sizes))
    ]
end

end