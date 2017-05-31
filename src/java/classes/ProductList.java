package classes;


import classes.Product;
import java.util.ArrayList;


public class ProductList {
    private ArrayList<Product> p ;
    
    public ProductList() {
        this.p = new ArrayList<Product>();
    }
    public ArrayList<Product> getProducts() {
        return this.p;
    } 
    public void setProducts(ArrayList<Product> products) {
        this.p = products;
    }
    
    
}
