package comparator;

import com.kinben233.DDMall.pojo.Product;

import java.util.Comparator;

//把 价格低的放前面
public class ProductPriceComparator implements Comparator<Product> {
    @Override
    public int compare(Product p1, Product p2) {
        return (int) (p1.getPromotePrice()-p2.getPromotePrice());
    }
}
