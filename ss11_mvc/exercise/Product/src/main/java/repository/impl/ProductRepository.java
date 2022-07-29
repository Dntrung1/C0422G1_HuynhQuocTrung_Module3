package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer,Product> products = new HashMap<>();
    static {
        products.put(1,new Product(1,"Bánh",1000,"a","b"));
        products.put(2,new Product(2,"Kẹo",2000,"c","d"));
        products.put(3,new Product(3,"Sữa",3000,"e","f"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void add(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void delete(int id) {
        products.remove(id);
    }

    @Override
    public Product productDetail(int id) {
        return null;
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }
}
