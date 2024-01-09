package com.example.MarketApp.Recipify.Ingredient;

import com.example.MarketApp.business.base.entity.BaseEntity;
import jakarta.persistence.*;

@Entity
@Table(name = "ingredient")
public class Ingredient extends BaseEntity {

    @Column(name = "name")
    private String name;

    public Ingredient() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
