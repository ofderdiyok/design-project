package com.example.MarketApp.Recipify.Ingredient;

import com.example.MarketApp.Recipify.Recipe.Recipe;
import com.example.MarketApp.business.base.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "ingredients")
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
