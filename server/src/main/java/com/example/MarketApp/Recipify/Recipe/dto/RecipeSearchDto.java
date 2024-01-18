package com.example.MarketApp.Recipify.Recipe.dto;

import com.example.MarketApp.Recipify.Ingredient.dto.IngredientSelectImplDto;

import java.util.List;

public class RecipeSearchDto {
    private String name;
    private double minCalories;
    private double maxCalories;
    private List<IngredientSelectImplDto> ingredientSelectImplDtoList;

    public RecipeSearchDto() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getMinCalories() {
        return minCalories;
    }

    public void setMinCalories(double minCalories) {
        this.minCalories = minCalories;
    }

    public double getMaxCalories() {
        return maxCalories;
    }

    public void setMaxCalories(double maxCalories) {
        this.maxCalories = maxCalories;
    }

    public List<IngredientSelectImplDto> getIngredientSelectImplDtoList() {
        return ingredientSelectImplDtoList;
    }

    public void setIngredientSelectImplDtoList(List<IngredientSelectImplDto> ingredientSelectImplDtoList) {
        this.ingredientSelectImplDtoList = ingredientSelectImplDtoList;
    }
}
