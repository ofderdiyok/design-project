package com.example.MarketApp.Recipify.CERecipeIngredient;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CERecipeIngredientRepository extends JpaRepository<CERecipeIngredient, Long> {
    Optional<CERecipeIngredient> findAllByRecipeIdAndIngredientId(long recipeId, long ingredientId);
}
