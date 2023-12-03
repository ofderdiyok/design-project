package com.example.MarketApp.Recipify.Recipe.dto;

import com.example.MarketApp.business.base.dto.BaseDetailDto;

public class RecipeDetailDto extends BaseDetailDto {
    private String name;
    private String description;
    private String image;
    private double calories;

    public RecipeDetailDto() {
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
}
