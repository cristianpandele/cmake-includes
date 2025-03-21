# HEADS UP: Pamplejuce assumes anything you stick in the assets folder you want to included in your binary!
# This makes life easy, but will bloat your binary needlessly if you include unused files
file(GLOB_RECURSE AssetFiles CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/assets/*")
list (FILTER AssetFiles EXCLUDE REGEX "/\\.DS_Store$") # We don't want the .DS_Store on macOS though...

# Setup our binary data as a target called Assets
juce_add_binary_data(BinaryData SOURCES ${AssetFiles})

# Required for Linux happiness:
# See https://forum.juce.com/t/loading-pytorch-model-using-binarydata/39997/2
set_target_properties(BinaryData PROPERTIES POSITION_INDEPENDENT_CODE TRUE)
