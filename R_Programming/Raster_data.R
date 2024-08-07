# There are two common kinds of spatial data: raster data and vector data.
# Raster data is designed to store geospatial information that is continuous across space.
# It is the most common type of data for things like climate variables, satellite imagery, and elevation, stored in a gridded format.
# Each pixel in raster data contains a numeric value representing a specific attribute.
# The 'stars' package is modern and well-suited for handling raster data.

# We are importing elevation data collected from an airplane using LIDAR,
# specifically data collected by the National Ecological Observatory Network.
library(stars)
library(ggplot2)
# download the data from the below link
#https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa3FSeFVtVzJqQ3dxSEphdEtUTHFVUVZPNGVfQXxBQ3Jtc0trR2xtSU44Y0tKeW9rSGdfa1NXdmR1bXFsUVdTY2xMUk16Z3VGVV8zWTVVRTFyMnQwck5kazR2MjdseHVaeFlEbmI2MDRpbnc0WWxtUDM4aW45NGdCVVRLNGRGT00zQjZCMlZqVzN4TnR6WGNzZy1mQQ&q=https%3A%2F%2Fdatacarpentry.org%2Fsemester-biology%2Fdata%2Fneon-geospatial-data.zip&v=F
# Read the Digital Terrain Model (DTM) elevation data from a TIFF file
dtm_harv <- read_stars("D:/Vaishnavi/004_R_Programming/neon-geospatial-data/harv/harv_dtmcrop.tif")

# Display the imported data to confirm it has been loaded correctly
dtm_harv

# Now, let's visualize the data using ggplot2, a popular plotting package in R.
# We will plot the raster data using the geom_stars function, which is suitable for stars objects.
# Here, we apply a color scale to represent the numeric values in the raster data.

# Plot the raster data using ggplot2 with a default color scale
ggplot() +
  geom_stars(data = dtm_harv)

# Alternatively, enhance the plot by applying the 'viridis' color palette using scale_fill_viridis_c().
ggplot() +
  geom_stars(data = dtm_harv) +
  scale_fill_viridis_c()
