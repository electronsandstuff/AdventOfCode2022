module Day05

using AdventOfCode2022


move1!(boxes, n, frm, to) = append!(boxes[to], [pop!(boxes[frm]) for _ in 1:n])
move2!(boxes, n, frm, to) = append!(boxes[to], [pop!(boxes[frm]) for _ in 1:n][end:-1:1])
last_boxes(b) = String(last.(b))

function day05(input::String = readInput(joinpath(@__DIR__, "data", "day02.txt")))
    box_str = input[1:findfirst(x->x=='1', input) - 3]
    boxes = reduce(hcat, collect.(split(box_str, '\n')))[2:4:end, end:-1:1]
    boxes = filter.(isletter, eachrow(boxes))

    move_str = input[findfirst(x->x=='m', input):end]
    moves = parse.(Int, filter(x->isdigit(x[1]), split(move_str)))
    moves = reshape(moves, 3, size(moves)[1]÷3)

    boxes1 = deepcopy(boxes)
    map(x->move1!(boxes1, x...), eachcol(moves))

    boxes2 = deepcopy(boxes)
    map(x->move2!(boxes2, x...), eachcol(moves))

    [last_boxes(boxes1), last_boxes(boxes2)]
end

end
