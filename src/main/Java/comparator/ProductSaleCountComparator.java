package comparator;

import java.util.Comparator;
import com.kinben233.DDMall.pojo.Product;

//把销量高的放前面
public class ProductSaleCountComparator implements Comparator<Product> {
    @Override
    public int compare(Product p1, Product p2) {
        return p2.getSaleCount()-p1.getSaleCount();
    }
}
