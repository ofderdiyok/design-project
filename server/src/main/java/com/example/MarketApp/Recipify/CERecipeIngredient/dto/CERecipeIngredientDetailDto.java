package com.example.MarketApp.Recipify.CERecipeIngredient.dto;

import com.example.MarketApp.Recipify.Ingredient.dto.IngredientDetailDto;
import com.example.MarketApp.Recipify.Recipe.dto.RecipeDetailDto;
import com.example.MarketApp.business.base.dto.BaseDetailDto;

public class CERecipeIngredientDetailDto extends BaseDetailDto {

    private RecipeDetailDto recipeDetailDto;
    private IngredientDetailDto ingredientDetailDto;
    public CERecipeIngredientDetailDto() {
    }

    public RecipeDetailDto getRecipeDetailDto() {
        return recipeDetailDto;
    }

    public void setRecipeDetailDto(RecipeDetailDto recipeDetailDto) {
        this.recipeDetailDto = recipeDetailDto;
    }

    public IngredientDetailDto getIngredientDetailDto() {
        return ingredientDetailDto;
    }

    public void setIngredientDetailDto(IngredientDetailDto ingredientDetailDto) {
        this.ingredientDetailDto = ingredientDetailDto;
    }
}
