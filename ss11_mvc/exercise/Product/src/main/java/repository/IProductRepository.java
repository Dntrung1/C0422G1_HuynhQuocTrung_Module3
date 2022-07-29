package repository;

import model.Product;

import java.util.List;
import java.util.Map;

public interface IProductRepository {
    List<Product> findAll();
    void add(Product product);
    void update(int id, Product product);
    void delete(int id);
    Product productDetail(int id);
    Product findById(int id);
}
