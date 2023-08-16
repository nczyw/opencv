cmake_minimum_required(VERSION 3.5)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#记录opencv版本
set(OpenCV_VERSION 4.8.0)
set(OpenCV_VERSION_MAJOR  4)
set(OpenCV_VERSION_MINOR  8)
set(OpenCV_VERSION_PATCH  0)
set(OpenCV_VERSION_TWEAK  0)
set(OpenCV_VERSION_STATUS "")

#这一步是获取Qt版本号,如果加载本cmake时顶层cmake没有获取到Qt版本，报错停止
find_package(QT NAMES Qt6 Qt5)#FATAL_ERROR
if(${QT_VERSION_MAJOR})
    message("Qt Version is " ${QT_VERSION_MAJOR})
else()
    message(FATAL_ERROR "Can't get Qt version number")
endif()
#获取编译器
set (Compiler ${CMAKE_CXX_COMPILER_ID})
#判断操作系统
if(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
    #判断编译器
    #MingW GCC
    if(Compiler MATCHES "GNU")
        #配置环境变量
        include_directories(${CMAKE_CURRENT_LIST_DIR}/MingW/Qt${QT_VERSION_MAJOR}/include)
        include_directories(${CMAKE_CURRENT_LIST_DIR}/MingW/Qt${QT_VERSION_MAJOR}/include/opencv2)
        #查找mingw lib库
        file(GLOB opencvliblist ${CMAKE_CURRENT_LIST_DIR}/MingW/Qt${QT_VERSION_MAJOR}/lib/*.a)
        #查找运行库
        file(GLOB opencvdlllist ${CMAKE_CURRENT_LIST_DIR}/MingW/Qt${QT_VERSION_MAJOR}/bin/*.dll)
    endif()
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
#linux时的操作
endif()
install(FILES ${opencvdlllist} DESTINATION ${CMAKE_BINARY_DIR})
