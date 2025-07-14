cmake_minimum_required(VERSION 3.10)
project(CUTE_Tutorials)

# 设置 CUDA 编译器
enable_language(CUDA)
set(CMAKE_CUDA_COMPILER nvcc)

# 设置 CUTLAS 路径（请替换为你的实际路径）
set(CUTLASS_DIR "/path/to/cutlass" CACHE PATH "Path to CUTLAS library")

# 遍历所有子目录并编译 .cu 文件
file(GLOB tutorial_dirs "*/")
foreach(dir ${tutorial_dirs})
    # 获取目录名（如 "01-Layout_for_CUTE"）
    get_filename_component(dir_name ${dir} NAME)
    
    # 查找该目录下的 .cu 文件
    file(GLOB cu_files "${dir}/*.cu")
    
    # 为每个 .cu 文件创建可执行文件
    foreach(cu_file ${cu_files})
        # 获取不带扩展名的文件名（如 "layout"）
        get_filename_component(exe_name ${cu_file} NAME_WE)
        
        # 创建有效的目标名称（用下划线替换斜杠）
        set(target_name "${dir_name}_${exe_name}")
        
        # 添加可执行目标
        add_executable(${target_name} ${cu_file})
        
        # 设置输出文件名和路径
        set_target_properties(${target_name} PROPERTIES
            OUTPUT_NAME ${exe_name}
            RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${dir_name}
        )
        
        # 设置编译选项
        target_include_directories(${target_name} PRIVATE ${CUTLASS_DIR}/include)
        target_compile_options(${target_name} PRIVATE -O3)
    endforeach()
endforeach()