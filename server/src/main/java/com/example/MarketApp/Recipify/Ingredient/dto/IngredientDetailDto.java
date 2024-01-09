package com.example.MarketApp.Recipify.Ingredient.dto;

import com.example.MarketApp.Recipify.Recipe.Recipe;
import com.example.MarketApp.business.base.dto.BaseDetailDto;

public class IngredientDetailDto extends BaseDetailDto {
    private String name;
    private Recipe recipe;

    public IngredientDetailDto() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }
}
