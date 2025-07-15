#include "cute/layout.hpp"
int main(int argc, char const *argv[])
{
    // Fundamental Types and Concepts
    // Integers
    // 两种使用cute常量的方式
    if(cute::Int<1>{} == cute::_1{})
    {
        printf("cute::Int<1>{} == cute::_1{}\n");
    }
    else
    {
        printf("cute::Int<1>{} != cute::_1{}\n");
    }

    // 判断是否为静态或动态整数类型
    printf("cute::is_integral<cute::Int<1>>::value: %d\n", cute::is_integral<cute::Int<1>>::value);
    printf("cute::is_integral<int>::value: %d\n", cute::is_integral<int>::value);
    // 判断是否是动态整数类型
    printf("cute::is_std_integral<cute::Int<1>>::value: %d\n", cute::is_std_integral<cute::Int<1>>::value);
    printf("cute::is_std_integral<int>::value: %d\n", cute::is_std_integral<int>::value);
    // 判断是否是空类型，没有成员的类型
    printf("cute::is_static<cute::Int<1>>::value: %d\n", cute::is_static<cute::Int<1>>::value);
    // 判断是否是常量
    printf("cute::is_constant<1, cute::Int<1>>::value: %d\n", cute::is_constant<1, cute::Int<1>>::value);

    // IntTuples
    auto int_tuple = cute::make_tuple(uint16_t{42}, cute::make_tuple(cute::Int<1>{}, int32_t{3}), cute::Int<17>{});
    printf("int_tuple: ");
    cute::print(int_tuple);
    printf("\n");

    // 获取int_tuple的元素个数
    printf("int_tuple的元素个数: ");    
    cute::print(cute::rank(int_tuple));
    printf("\n");
    // 获取int_tuple的第0个元素
    printf("int_tuple的第0个元素: ");
    cute::print(cute::get<0>(int_tuple));
    printf("\n");
    // 获取int_tuple的深度
    printf("int_tuple的深度: ");
    cute::print(cute::depth(int_tuple));
    printf("\n");
    // 获取product（类似向量的大小）
    printf("int_tuple的所有元素的product: ");
    cute::print(cute::size(int_tuple));
    printf("\n");    

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
    printf("layout的实际存储大小: ");
    cute::print(cute::cosize(layout));  
    printf("\n");
    // 打印layout排布
    printf("layout排布: ");
    cute::print_layout(layout);
    printf("\n");

    


    return 0;
}
