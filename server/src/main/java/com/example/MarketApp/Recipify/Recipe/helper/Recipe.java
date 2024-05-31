package com.example.MarketApp.Recipify.Recipe.helper;

import com.example.MarketApp.Recipify.C_RecipeIngredient.C_RecipeIngredient;
import com.example.MarketApp.Recipify.Ingredient.Ingredient;

import java.util.ArrayList;

public class Recipe {
    private Long id;
    private String name;
    private String description;
    private String category;
    private String image;
    private double calories;
    private ArrayList<String> recipeIngredients = new ArrayList<>();

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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
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


    public ArrayList<String> getRecipeIngredients() {
        return recipeIngredients;
    }

    public void setRecipeIngredients(ArrayList<String> recipeIngredients) {
        this.recipeIngredients = recipeIngredients;
    }
}
