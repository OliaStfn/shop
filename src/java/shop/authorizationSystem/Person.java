package shop.authorizationSystem;

import java.time.LocalDate;

public class Person {
    private int id;
    private String name;
    private String surname;
    private LocalDate bornDate;
    private UserState state;

    public Person() {
        id=0;
        name="none";
        surname="none";
        bornDate=LocalDate.now();
        state=UserState.CUSTOMER;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public LocalDate getBornDate() {
        return bornDate;
    }

    public void setBornDate(LocalDate bornDate) {
        this.bornDate = bornDate;
    }

    public UserState getState() {
        return state;
    }

    public void setState(UserState state) {
        this.state = state;
    }
}
