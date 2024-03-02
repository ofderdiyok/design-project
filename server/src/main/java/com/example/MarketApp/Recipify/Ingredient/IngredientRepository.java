package com.example.MarketApp.Recipify.Ingredient;

import org.springframework.data.jpa.repository.JpaRepository;

public interface IngredientRepository extends JpaRepository<Ingredient, Long> {
    boolean existsByName(String name);

    Ingredient findByName(String name);
}
