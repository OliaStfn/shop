package shop.authorizationSystem;

import shop.productSystem.FavouriteList;
import shop.purchaseSystem.Bucket;

public class Customer extends Person{
    private Account account;
    private FavouriteList favouriteList;
    private Bucket bucket;

    public Customer() {
        super();
        account=new Account();
        favouriteList=new FavouriteList();
        bucket=new Bucket();
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public FavouriteList getFavouriteList() {
        return favouriteList;
    }

    public void setFavouriteList(FavouriteList favouriteList) {
        this.favouriteList = favouriteList;
    }

    public Bucket getBucket() {
        return bucket;
    }

    public void setBucket(Bucket bucket) {
        this.bucket = bucket;
    }
}
