module Day08

using AdventOfCode2022


function read_arr(input)
    n = findfirst('\n', input) - 1
    x = filter(x->x>=0, Int.(collect(input)) .- Int('0'))
    reshape(x, n, length(x)÷n)
end

is_visible(a, b) = findfirst(x->x>=a, b) === nothing
view_dist(a, b) = let z=findfirst(x->x>=a, b); z===nothing ? length(b) : z; end


function day08(input::String = readInput(joinpath(@__DIR__, "data", "day08.txt")))
    arr = read_arr(input)

    # The vector of which trees are visible (0=untested, -1=not visible, 1=visible)
    visible = ones(Bool, size(arr)...)
    scenic_score = zeros(Int, size(arr)...)
    for i in 2:size(visible)[1]-1
        for j in 2:size(visible)[2]-1
            dirs = (arr[i-1:-1:1,j], arr[i+1:end,j], arr[i,j-1:-1:1], arr[i,j+1:end])
            visible[i,j] = |(is_visible.(arr[i,j], dirs)...)
            scenic_score[i,j] = *(view_dist.(arr[i,j], dirs)...)
        end
    end

    [sum(visible), maximum(scenic_score)]
end

end
