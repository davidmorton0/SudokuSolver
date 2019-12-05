require "test/unit/assertions"
include Test::Unit::Assertions

N = 9
M = 3

def sudoku(puzzle)
	while count_spaces(puzzle) > 0 do
    fill_in_possibles(puzzle)
  end
	puzzle.each do |line|
		puts "#{line}"
	end
	puts "\n"
  return puzzle
end

def count_spaces(puzzle)
	puzzle.flatten.count(0)
end

def row(puzzle, y)
     puzzle[y]
end

def column(puzzle, x)
     puzzle.map { |n| n[x] }
end

def square(puzzle, x, y)
     puzzle.drop(M * (y / M)).take(M).map { |n| n.drop(M * (x / M)).take(M) }.flatten
end

def fill_in_possibles(puzzle)
     (0..N - 1).map do |x|
          (0..N - 1).map do |y|
               if puzzle[y][x] == 0
                    possibilities = (1..9).to_a - (row(puzzle, y) + column(puzzle, x) + square(puzzle, x, y)).uniq
                    puzzle[y][x] = possibilities[0] if possibilities.length == 1
               end
          end
     end
end

puzzle = [
  [5,3,0,0,7,0,0,0,0],
  [6,0,0,1,9,5,0,0,0],
  [0,9,8,0,0,0,0,6,0],
  [8,0,0,0,6,0,0,0,3],
  [4,0,0,8,0,3,0,0,1],
  [7,0,0,0,2,0,0,0,6],
  [0,6,0,0,0,0,2,8,0],
  [0,0,0,4,1,9,0,0,5],
  [0,0,0,0,8,0,0,7,9]]

 solution = [
  [5,3,4,6,7,8,9,1,2],
  [6,7,2,1,9,5,3,4,8],
  [1,9,8,3,4,2,5,6,7],
  [8,5,9,7,6,1,4,2,3],
  [4,2,6,8,5,3,7,9,1],
  [7,1,3,9,2,4,8,5,6],
  [9,6,1,5,3,7,2,8,4],
  [2,8,7,4,1,9,6,3,5],
  [3,4,5,2,8,6,1,7,9]]


puzzle2 = [
  [5, 6, 0, 8, 4, 7, 0, 0, 0],
  [3, 0, 9, 0, 0, 0, 6, 0, 0],
  [0, 0, 8, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 8, 0, 0, 4, 0],
  [7, 9, 0, 6, 0, 2, 0, 1, 8],
  [0, 5, 0, 0, 3, 0, 0, 9, 0],
  [0, 0, 0, 0, 0, 0, 2, 0, 0],
  [0, 0, 6, 0, 0, 0, 8, 0, 7],
  [0, 0, 0, 3, 1, 6, 0, 5, 9]]

solution2 = [
  [5, 6, 1, 8, 4, 7, 9, 2, 3],
  [3, 7, 9, 5, 2, 1, 6, 8, 4],
  [4, 2, 8, 9, 6, 3, 1, 7, 5],
  [6, 1, 3, 7, 8, 9, 5, 4, 2],
  [7, 9, 4, 6, 5, 2, 3, 1, 8],
  [8, 5, 2, 1, 3, 4, 7, 9, 6],
  [9, 3, 5, 4, 7, 8, 2, 6, 1],
  [1, 4, 6, 2, 9, 5, 8, 3, 7],
  [2, 8, 7, 3, 1, 6, 4, 5, 9]]

puzzle3 = [
  [8, 0, 0, 0, 6, 0, 0, 0, 3],
  [4, 0, 0, 8, 0, 3, 0, 0, 1],
  [7, 0, 0, 0, 2, 0, 0, 0, 6],
  [0, 6, 0, 0, 0, 0, 2, 8, 0],
  [0, 0, 0, 4, 1, 9, 0, 0, 5],
  [0, 0, 0, 0, 8, 0, 0, 7, 9],
  [5, 3, 0, 0, 7, 0, 0, 0, 0],
  [6, 0, 0, 1, 9, 5, 0, 0, 0],
  [0, 9, 8, 0, 0, 0, 0, 6, 0]]

solution3 = [
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 4, 5, 2, 8, 6, 1, 7, 9],
  [5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7]]

assert_equal(sudoku(puzzle), solution)
assert_equal(sudoku(puzzle2), solution2)
assert_equal(sudoku(puzzle3), solution3)
