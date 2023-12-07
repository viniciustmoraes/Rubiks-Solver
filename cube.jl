
# Defines the solved cube configuration
function solved_color_state()
    tmp = ones(Int, 6, 3, 3)
    for i in 1:6
        tmp[i, :, :] = i * ones(Int, 3, 3)
    end
    return tmp
end

# Defines an array of dictionaries, containing the relevant connections of each face.
face_connections = [
    Dict("N" => 6, "S" => 5, "W" => 4, "E" => 2, "O" => 3) # 1
    Dict("N" => 6, "S" => 5, "W" => 1, "E" => 3, "O" => 4) # 2
    Dict("N" => 6, "S" => 5, "W" => 2, "E" => 4, "O" => 1) # 3
    Dict("N" => 6, "S" => 5, "W" => 3, "E" => 1, "O" => 2) # 4
    Dict("N" => 1, "S" => 3, "W" => 4, "E" => 2, "O" => 6) # 5
    Dict("N" => 3, "S" => 1, "W" => 4, "E" => 2, "O" => 5) # 6
]

mutable struct Cube
    color_state::Array{Int,3}
    initial_state::Array{Int,3}

    # Cube constructor function. Defaults to solved cube
    function Cube(color_state::Array{Int,3})
        new(color_state, initial_state)
    end
end

"""
Rotates the square input_matrix in a given direction. Returns the output, keeping input_matrix unchanged.
The direction can be either True - follows the right hand rule; or False - follows the opposite 
"""
function matrix_rotation(input_matrix::Matrix, direction::Bool)
    ans = copy(input_matrix)
    if direction
        for col in 1:size(input_matrix)[1]
            ans[:, col] = reverse(input_matrix[col, :])
        end
    else
        for col in 1:size(input_matrix)[1]
            ans[:, end-col+1] = input_matrix[col, :]
        end
    end

    return ans
end

x = ["a" "b" "c"; "d" "e" "f"; "g" "h" "i"]
y = matrix_rotation(x, true)
z = matrix_rotation(x, false)
println("x", x)
println("y", y)
println("z", z)