Pkg.add("Images")
using Random
using Images

img = load("4.1.07.tiff")

channel_img = channelview(img)

perm_img = permutedims(channelview(img),(2,3,1))

channel_r = perm_img[:,:,1]

