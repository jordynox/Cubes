# Set the minimum required version for CMake
cmake_minimum_required(VERSION 3.18)

# Set project name and version
project(FirecourtCubes VERSION 1.0 LANGUAGES C CXX Swift)

# Set platform-specific configurations
if(APPLE)
    set(MACOS TRUE)
elseif(UNIX)
    set(LINUX TRUE)
endif()

# Specify where to find the external dependencies
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMakeModules" ${CMAKE_MODULE_PATH})

# Enable Swift support
enable_language(Swift)

# Set the location for external dependencies (like Pods, etc.)
include_directories(${PROJECT_SOURCE_DIR}/Cubes/AudioEngine)
include_directories(${PROJECT_SOURCE_DIR}/Cubes/GraphicEngine)

# Add C++ source files
file(GLOB_RECURSE CXX_SOURCES
    "${PROJECT_SOURCE_DIR}/Cubes/AudioEngine/*.cpp"
    "${PROJECT_SOURCE_DIR}/Cubes/GraphicEngine/*.cpp"
    "${PROJECT_SOURCE_DIR}/Cubes/Plugins/*.cpp"
)

# Add Swift source files
file(GLOB_RECURSE SWIFT_SOURCES
    "${PROJECT_SOURCE_DIR}/Cubes/*.swift"
    "${PROJECT_SOURCE_DIR}/Cubes/AudioEngine/*.swift"
    "${PROJECT_SOURCE_DIR}/Cubes/GraphicEngine/*.swift"
)

# Set up the executable
add_executable(FirecourtCubes
    ${CXX_SOURCES}
    ${SWIFT_SOURCES}
)

# Link libraries for MacOS and Linux
if(MACOS)
    target_link_libraries(FirecourtCubes "-framework Cocoa")
    set_target_properties(FirecourtCubes PROPERTIES MACOSX_BUNDLE TRUE)
elseif(LINUX)
    target_link_libraries(FirecourtCubes pthread)
endif()

# Link required dependencies like TensorFlow, Firebase, etc.


# Additional configurations for integrating with AppKit and Cocoa on MacOS
if(MACOS)
    # Linking AppKit and other required frameworks for MacOS
    target_link_libraries(FirecourtCubes "-framework AppKit")
    target_link_libraries(FirecourtCubes "-framework Foundation")
    target_link_libraries(FirecourtCubes "-framework QuartzCore")
endif()

# Enable testing and add unit tests
enable_testing()

# Add unit test sources
file(GLOB_RECURSE TEST_SOURCES "${PROJECT_SOURCE_DIR}/CubesTests/*.cpp")




# Define installation rules (optional, for packaging)
install(TARGETS FirecourtCubes DESTINATION /usr/local/bin)
install(DIRECTORY ${PROJECT_SOURCE_DIR}/Cubes/Assets.xcassets DESTINATION /usr/local/share/assets)

# Define additional configurations if using external tools like fastlane
set(FASTLANE_DIR "${PROJECT_SOURCE_DIR}/fastlane")


# Package the project (optional, add additional configuration)
include(CPack)
