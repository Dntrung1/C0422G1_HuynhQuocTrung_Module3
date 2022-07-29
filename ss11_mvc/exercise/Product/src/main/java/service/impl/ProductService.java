package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {
    IProductRepository iProductRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return iProductRepository.findAll();
    }

    @Override
    public void add(Product product) {
        iProductRepository.add(product);
    }

    @Override
    public void update(int id, Product product) {
        iProductRepository.update(id,product);
    }

    @Override
    public void delete(int id) {
        iProductRepository.delete(id);
    }

    @Override
    public Product productDetail(int id) {
        return null;
    }

    @Override
    public Product findById(int id) {
        return iProductRepository.findById(id);
    }
}
