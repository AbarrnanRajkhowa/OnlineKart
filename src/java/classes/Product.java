package classes;


public class Product {
    private String pName;
    private String type;
    private String image;
    private int pPrice;
    private int pQty;
    private int total;
    private int pID;
    public Product(){
        this("","","",0,0,0);
        
    }
    public Product(String name,String type,String img,int price , int quantity, int pid){
        this.pName=name;
        this.pPrice = price;
        this.pQty = quantity; 
        this.pID = pid;
        this.type = type;
        this.image = img;
        
    }
    public int totalPprice(){
        this.total=pPrice*pQty;
        return this.total;
    }
    public int getPrice() {
        return this.pPrice;
    }
    public void setPrice(int price) {
        this.pPrice = price;
    }
    public int getQty() {
        return this.pQty;
    }
    public void setQty( int qty) {
        this.pQty = qty;
    }
    public String getName(){
        return this.pName;
    }
    public void setName(String setName) {
        this.pName = setName;
    }
    public int getId() {
        return this.pID;
    }
    public void setId(int pid){
        this.pID = pid;
    }
    public String getType(){
        return this.type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getImage() {
        return this.image;
    }
    public void setImage(String img) {
        this.image = img;
    }
}
