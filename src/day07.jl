module Day07

using AdventOfCode2022

line2file(l) = let n=findfirst(' ', l); (l[n+1:end], parse(Int, l[1:n-1])); end
files(s) = line2file.(filter(x->!isempty(x)&&isnumeric(x[1]), split(s, '\n')))

path_acc(x, y) = let n=findfirst('\n', y); (normpath(joinpath(x[1], y[1:n-1])), n!=length(y) ? files(y[n:end]) : nothing); end
_pathsnfiles(s) = Iterators.accumulate(
    path_acc,
    eachsplit(s, raw"$ cd ", keepempty=false),
    init=("", ())
)
pathsnfiles(s) = Iterators.filter(x->x[2] !== nothing, _pathsnfiles(s))

pathsep = Sys.iswindows() ? '\\' : '/'
get_files(fs, path::AbstractString) = get_files(fs, split(path, pathsep, keepempty=false))
get_files(fs, path) = isempty(path) ? fs[2] : get_files(get!(fs[1], first(path), (Dict(), [])), path[2:end])

assemble_fs(s) = let r=(Dict(), [])
    [append!(get_files(r, p), f) for (p, f) in pathsnfiles(s)]
    r
end

function printfs(fs, name="/", indent=0)
    start = repeat(" ", 2*indent)
    println(start, "- ", name, " (dir)")
    [printfs(d, n, indent+1) for (n, d) in fs[1]]
    [println(start, "  - ", f[1], " (file, size=", f[2], ")") for f in fs[2]]
end

# Can't believe this works ;)  (forms vector of all directory sizes in the files tree)
dirsizes(fs) = let s=dirsizes.(values(fs[1])); push!(vcat(s...), sum(last.(fs[2]), init=0) + sum(last.(s), init=0)); end

function day07(input::String = readInput(joinpath(@__DIR__, "data", "day07.txt")))
    sizes = dirsizes(assemble_fs(input))
    [
        sum(filter(x->x<=100000, sizes)), 
        minimum(filter(x->(70000000 - last(sizes)+x)>30000000, sizes))
    ]
end

end