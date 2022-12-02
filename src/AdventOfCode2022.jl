module AdventOfCode2022

# From goggle on github
function readInput(path::String)
    s = open(path, "r") do file
        read(file, String)
    end
    return s
end

export readInput

end # module AdventOfCode2022
