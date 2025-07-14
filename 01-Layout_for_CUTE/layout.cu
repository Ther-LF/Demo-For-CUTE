#include "cute/layout.hpp"
int main(int argc, char const *argv[])
{
    // 常量shape
    auto shape = cute::make_shape(cute::Int<2>{}, cute::Int<4>{});
    printf("常量shape: ");
    cute::print(shape);
    printf("\n");
    auto shape1 = cute::make_shape(cute::Int<4>{}, shape);
    printf("嵌套常量shape: ");
    cute::print(shape1);
    printf("\n");

    // 变量shape
    auto shape_var = cute::make_shape(2, 4);
    printf("变量shape: ");
    cute::print(shape_var);
    printf("\n");
    auto shape_var1 = cute::make_shape(4, shape_var);
    printf("嵌套变量shape: ");
    cute::print(shape_var1);
    printf("\n");

    // 常量stride
    auto stride = cute::make_stride(cute::Int<1>{}, cute::Int<8>{});
    printf("常量stride: ");
    cute::print(stride);
    printf("\n");
    auto stride1 = cute::make_stride(cute::Int<2>{}, stride);
    printf("嵌套常量stride: ");
    cute::print(stride1);
    printf("\n");

    // 变量stride
    auto stride_var = cute::make_stride(1, 8);
    printf("变量stride: ");
    cute::print(stride_var); 
    printf("\n");
    auto stride_var1 = cute::make_stride(2, stride_var);
    printf("嵌套变量stride: ");
    cute::print(stride_var1);
    printf("\n");
    
    // 通过查看代码可以发现shape和stride的本质都是tuple
    // 所以可以像tuple一样使用
    printf("shape第0个元素: ");
    cute::print(cute::get<0>(shape));
    printf("\n");
    printf("shape第1个元素: ");
    cute::print(cute::get<1>(shape));
    printf("\n");
    printf("shape_var第0个元素: ");
    cute::print(cute::get<0>(shape_var));
    printf("\n");
    printf("shape_var第1个元素: ");
    cute::print(cute::get<1>(shape_var));
    printf("\n");
    
    // 嵌套layout
    auto layout = cute::make_layout(shape1, stride1);
    printf("嵌套layout: ");
    cute::print(layout);
    printf("\n");
    printf("layout详细信息: ");
    cute::print_layout(layout);
    printf("\n");

    return 0;
}
