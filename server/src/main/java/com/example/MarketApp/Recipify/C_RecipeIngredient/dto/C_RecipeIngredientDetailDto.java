package com.example.MarketApp.Recipify.C_RecipeIngredient.dto;

import com.example.MarketApp.Recipify.Ingredient.dto.IngredientDetailDto;
import com.example.MarketApp.Recipify.Recipe.dto.RecipeDetailDto;

public class C_RecipeIngredientDetailDto {
    private Long id;
    private RecipeDetailDto recipe;
    private IngredientDetailDto ingredient;

    public C_RecipeIngredientDetailDto() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public RecipeDetailDto getRecipe() {
        return recipe;
    }

    public void setRecipe(RecipeDetailDto recipe) {
        this.recipe = recipe;
    }

    public IngredientDetailDto getIngredient() {
        return ingredient;
    }

    public void setIngredient(IngredientDetailDto ingredient) {
        this.ingredient = ingredient;
    }
}
