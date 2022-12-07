module Day07

using AdventOfCode2022

struct FSNode
    name::String
    parent::Union{FSNode, Nothing}
    files::Vector{Tuple{String, Int}}
    dirs::Vector{FSNode}
end

line2file(l) = let n=findfirst(' ', l); (l[n+1:end], parse(Int, l[1:n-1])); end
files(s) = line2file.(filter(x->!isempty(x)&&isnumeric(x[1]), split(s, '\n')))

function assemble_fs(s)
    cwd = fs = FSNode("/", nothing, [], [])
    for chunk in eachsplit(s, raw"$ cd ", keepempty=false)
        n=findfirst('\n', chunk)
        dir = chunk[1:n-1]
        if dir == "/"; cwd = fs
        elseif dir == ".."; cwd = cwd.parent
        else
            idx = findfirst(x->x.name==dir, cwd.dirs)
            if idx === nothing
                cwd = push!(
                    cwd.dirs, 
                    FSNode(dir, cwd, Vector{Tuple{String, Int}}(), Vector{FSNode}())
                    ) |> last
            else; cwd = cwd.dirs[idx]
            end
        end
        n != length(chunk) && append!(cwd.files, files(chunk[n:end]))
    end
    fs
end

dirsizes(fs::FSNode)::Vector{Int} = let s = dirsizes.(values(fs.dirs))
    push!(vcat(s...), sum(last.(fs.files)) + sum(last.(s)))
end

function printfs(fs, name="/", indent=0)
    start = repeat(" ", 2*indent)
    println(start, "- ", name, " (dir)")
    [printfs(d, d.name, indent+1) for d in fs.dirs]
    [println(start, "  - ", f[1], " (file, size=", f[2], ")") for f in fs.files]
end

function day07(input::String = readInput(joinpath(@__DIR__, "data", "day07.txt")))
    sizes = dirsizes(assemble_fs(input))
    [
        sum(filter(x->x<=100000, sizes)), 
        minimum(filter(x->(70000000 - last(sizes)+x)>30000000, sizes))
    ]
end

end