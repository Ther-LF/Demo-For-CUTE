#include "cute/layout.hpp"

int main(int argc, char const *argv[])
{
    auto shape = cute::make_shape(cute::make_shape(2, 4), cute::make_shape(3, 5));
    auto stride = cute::make_stride(cute::make_stride(3, 6), cute::make_stride(1, 24));
    auto layout = cute::make_layout(shape, stride);
    printf("布局信息: ");
    cute::print_layout(layout);
    printf("\n");

    // 坐标
    auto row_coord = cute::make_coord(1, 3); 
    auto col_coord = cute::make_coord(2, 4); 
    auto coord = cute::make_coord(row_coord, col_coord);
    printf("坐标: ");
    cute::print(coord);
    printf("\n");   

    auto idx = cute::crd2idx(coord, layout);
    printf("坐标转换为索引: ");
    cute::print(idx);
    printf("\n");


    // 切片
    auto coord_slice = cute::make_coord(cute::make_coord(_, 1), cute::make_coord(_, 1));

    return 0;
}
