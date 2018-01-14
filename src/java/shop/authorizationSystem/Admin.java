package shop.authorizationSystem;

import java.time.LocalDate;

public class Admin extends Person{
    private Account account;
    private LocalDate startWork;

    public Admin() {
        super();
        setState(UserState.ADMIN);
        account=new Account();
        startWork=LocalDate.now();
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public LocalDate getStartWork() {
        return startWork;
    }

    public void setStartWork(LocalDate startWork) {
        this.startWork = startWork;
    }
}
