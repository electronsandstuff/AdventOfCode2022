module Day06

using AdventOfCode2022

isunique(x) = all(i->all(j->x[i] != x[j], i+1:length(x)), 1:length(x))
windows(x, n) = ((@view x[i:i+n-1]) for i in 1:length(x)-n+1)
start_idx(x, n) = findfirst(isunique, windows(x, n)) + n - 1

function day06(input::String = readInput(joinpath(@__DIR__, "data", "day06.txt")))
   return [start_idx(input, 4), start_idx(input, 14)]
end

end
