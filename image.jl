using Pkg
Pkg.add("Images")
Pkg.add("BenchmarkTools")
using Random
using Images
using DataFrames
using BenchmarkTools

#img = load("4.1.07.tiff")

# when dealing with rbg values, currently working 
# with greyscale values
# channel_img = channelview(img)

# perm_img = permutedims(channelview(img),(2,3,1))

# channel_r = perm_img[:,:,1]


# greyscale view of the image
#img = load("George_W_Bush/George_W_Bush_0001.jpg")


function ProcessingDesignMatrix(relative_path_to_folder,orientation)
    #extract images from folder and process it to grayscale matrices
    list_img_path = readdir(relative_path_to_folder,join=true)

    #get the size of the img
    m::Int16,n::Int16 = size(load(list_img_path[1]))
    half_m = trunc(Int,m/2)

    #declaring design matrix
    design_matrix = Matrix{Float32}(undef,(half_m*n,1))

    if orientation == "top"
        row_range = 1:half_m
    elseif orientation == "bot"
        row_range = half_m+1:m
    end

    for img_path in list_img_path
        img = load(img_path)

        grey_matrix = Float32.(Gray.(img))[row_range,:] |> vec

        design_matrix = hcat(design_matrix,grey_matrix)
    end

    return permutedims(design_matrix)
end


design_matrix = ProcessingDesignMatrix("George_W_Bush","top")

y_matrix = ProcessingDesignMatrix("George_W_Bush","bot")

