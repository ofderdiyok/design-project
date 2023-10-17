package com.example.MarketApp.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.MarketApp.Models.Recipe;

public interface RecipeRepository extends JpaRepository<Recipe, Long> {
    @Query("SELECT DISTINCT r FROM Recipe r JOIN r.ingredients i WHERE i.name IN :ingredientNames")
    List<Recipe> findByRecipeIngredientsIn(@Param("ingredientNames") List<String> ingredientNames);
}
