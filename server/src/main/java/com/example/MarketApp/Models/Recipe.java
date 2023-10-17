package com.example.MarketApp.Models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

import java.util.List;
import lombok.Data;


@Entity
@Data
@Table(name = "recipes")  // You can customize the table name if needed
public class Recipe {
    @Id
    private Long id;

    private String name;
    private int totalTime;
    private String description;
    private String image;
    @ManyToMany
    @JoinTable(
            name = "recipe_ingredients",
            joinColumns = @JoinColumn(name = "recipe_id"),
            inverseJoinColumns = @JoinColumn(name = "ingredient_id")
    )
    private List<Ingredient> ingredients;
    private String instructions;
    private double calories;

   
}