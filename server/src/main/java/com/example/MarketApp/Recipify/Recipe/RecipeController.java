package com.example.MarketApp.Recipify.Recipe;

import com.example.MarketApp.Recipify.Recipe.dto.RecipeDetailDto;
import com.example.MarketApp.Recipify.Recipe.dto.RecipeSearchDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/recipes")
public class RecipeController {
    private final RecipeService recipeService;

    @Autowired
    public RecipeController(RecipeService recipeService) {
        this.recipeService = recipeService;
    }

    @GetMapping("/list")
    public List<Recipe> findAll() {
        return this.recipeService.findAll();
    }

    @GetMapping("/listWithIngredients")
    public List<com.example.MarketApp.Recipify.Recipe.helper.Recipe> findAllWithIngredients() {
        return this.recipeService.findAllwithIngredients();
    }

    @PostMapping("/save")
    public RecipeDetailDto saveEntity(@RequestBody RecipeDetailDto detailDto) {
        return this.recipeService.saveOrUpdate(detailDto);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteEntity(@RequestBody RecipeDetailDto detailDto) {
        this.recipeService.deleteEntity(detailDto);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/findByExample")
    public List<Recipe> findAllByExample(@RequestBody RecipeSearchDto searchDto) {
        return this.recipeService.findAllByExample(searchDto);
    }
}
