package com.example.MarketApp.Recipify.C_RecipeIngredient;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface C_RecipeIngredientRepository extends JpaRepository<C_RecipeIngredient, Long> {
    Optional<C_RecipeIngredient> findByRecipeIdAndIngredientId(long recipeId, long ingredientId);
    List<C_RecipeIngredient> findAllByRecipeId(long recipeId);
}
