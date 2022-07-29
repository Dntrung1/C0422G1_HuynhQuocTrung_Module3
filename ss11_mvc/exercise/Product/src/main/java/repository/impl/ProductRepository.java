package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.*;

public class ProductRepository implements IProductRepository {
    private static Map<Integer,Product> products = new HashMap<>();
    static {
        products.put(1,new Product(1,"Banh",1000,"a","b"));
        products.put(2,new Product(2,"Keo",2000,"c","d"));
        products.put(3,new Product(3,"Sua",3000,"e","f"));
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

    @Override
    public List<Product> findByName(String name) {
        List<Product> productArrayList = new ArrayList<>();
        Set<Integer> keys = products.keySet();
        for (int i : keys){
            if (products.get(i).getName().toLowerCase(Locale.ROOT).contains(name.toLowerCase(Locale.ROOT))){
                productArrayList.add(products.get(i));
            }
        }
        return productArrayList;
//       List<Product> productList = new ArrayList<>(products.values());
//       List<Product> result = new ArrayList<>();
//       for (Product p:productList){
//           if (p.getName().contains(name)){
//               result.add(p);
//           }
//       }
//        return result;
    }
}
