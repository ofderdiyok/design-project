package com.example.MarketApp.Recipify.Recipe;

import com.example.MarketApp.Recipify.C_RecipeIngredient.C_RecipeIngredient;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "recipe")
public class Recipe{
    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "image")
    private String image;

    @Column(name = "calories")
    private double calories;

    @JsonIgnore
    @OneToMany(mappedBy = "recipe", fetch = FetchType.LAZY)
    private Set<C_RecipeIngredient> cRecipeIngredients = new HashSet<>();

    public Recipe() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getCalories() {
        return calories;
    }

    public void setCalories(double calories) {
        this.calories = calories;
    }

    public Set<C_RecipeIngredient> getcRecipeIngredients() {
        return cRecipeIngredients;
    }

    public void setcRecipeIngredients(Set<C_RecipeIngredient> cRecipeIngredients) {
        this.cRecipeIngredients = cRecipeIngredients;
    }
}
