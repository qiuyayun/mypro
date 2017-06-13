/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author qiuyayun
 */
public class Books {
    private String id;
    private String title;
    private String author;
    private String publisher;
    private String date;
    private String price;
    private int statu;
    private String class_;
    public Books(String id,String title,String author, String publisher, String date,String price,int statu,String class_){
    this.id=id;
    this.title=title;
    this.author=author;
    this.date=date;
    this.price=price;
    this.publisher=publisher;
    this.statu=statu;
    this.class_=class_;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the author
     */
    public String getAuthor() {
        return author;
    }

    /**
     * @param author the author to set
     */
    public void setAuthor(String author) {
        this.author = author;
    }

    /**
     * @return the publisher
     */
    public String getPublisher() {
        return publisher;
    }

    /**
     * @param publisher the publisher to set
     */
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the price
     */
    public String getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(String price) {
        this.price = price;
    }

    /**
     * @return the statu
     */
    public int getStatu() {
        return statu;
    }

    /**
     * @param statu the statu to set
     */
    public void setStatu(int statu) {
        this.statu = statu;
    }

    /**
     * @return the class_
     */
    public String getClass_() {
        return class_;
    }

    /**
     * @param class_ the class_ to set
     */
    public void setClass_(String class_) {
        this.class_ = class_;
    }
}
