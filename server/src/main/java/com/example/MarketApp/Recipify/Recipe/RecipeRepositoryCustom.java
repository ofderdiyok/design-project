package com.example.MarketApp.Recipify.Recipe;

import com.example.MarketApp.Recipify.Recipe.dto.RecipeSearchDto;

import java.util.List;

public interface RecipeRepositoryCustom {
    List<Recipe> findByExample(RecipeSearchDto recipeSearchDto);
}
