package com.example.MarketApp.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.example.MarketApp.Models.Recipe;
import com.example.MarketApp.Repositories.RecipeRepository;

import java.util.List;

@RestController
@RequestMapping("/api/recipes")
public class RecipeController {

    @Autowired
    private RecipeRepository recipeRepository;

    @GetMapping
    public List<Recipe> getAllRecipes() {
        System.out.println("All recipe request is made");
        return recipeRepository.findAll();
    }

    @PostMapping("/{type}/byIngredients")
    public List<Recipe> getRecipesByIngredients(@PathVariable String type, @RequestBody List<String> ingredientNames) {
        return recipeRepository.findByRecipeIngredientsIn(ingredientNames);
    }
}