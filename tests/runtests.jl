using AdventOfCode2022
using Test

@testset begin
    @test day01("1000
    2000
    3000
    
    4000
    
    5000
    6000
    
    7000
    8000
    9000
    
    10000") == [24000, 45000]
end

@testset begin
    @test day02("A Y
    B X
    C Z") == [15, 12]
end

@testset begin
    @test day03("vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw") == [157, 70]
end

@testset begin
    @test day04("2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8") == [2, 4]
end


@testset begin
    @test day05("    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 
 
move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2") == ["CMZ", "MCD"]
end

@testset begin
    @test day06("mjqjpqmgbljsphdztnvjfqwrcgsmlb") == [7, 19]
    @test day06("bvwbjplbgvbhsrlpgdmjqwftvncz") == [5, 23]
    @test day06("nppdvjthqldpwncqszvftbrmjlhg") == [6, 23]
    @test day06("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == [10, 29]
    @test day06("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == [11, 26]
end

@testset begin
@test day07(raw"$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k") == [95437, 24933642]
end