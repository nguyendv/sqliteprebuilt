cmake_minimum_required(VERSION 3.4)

project("sqlitecpp")

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU" OR
    "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    set(warnings "-Wall -Wextra -Werror")
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    set(warnings "/W4 /WX /EHsc")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wno-deprecated-declarations -Wno-c++11-extensions")

set(SQLITE_CPP_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../SQLiteCpp)

file(GLOB sqlitecpp_src 
  ${SQLITE_CPP_DIR}/src/*.cpp
  ${SQLITE_CPP_DIR}/sqlite3/sqlite3.c               
)

# Enable the JSON1 extension
add_definitions(-DSQLITE_ENABLE_JSON1)

add_library(sqlitecpp SHARED
  ${sqlitecpp_src}
)

include_directories (
  ${SQLITE_CPP_DIR}/include
  ${SQLITE_CPP_DIR}/sqlite3
)

# Enable test if you want to
#enable_testing()
#add_subdirectory(test)
