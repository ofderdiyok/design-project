package com.example.MarketApp.Recipify.Ingredient;

import com.example.MarketApp.Recipify.Ingredient.dto.IngredientDetailDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/ingredients")
public class IngredientController {

    private final IngredientService ingredientService;

    @Autowired
    public IngredientController(IngredientService ingredientService) {
        this.ingredientService = ingredientService;
    }

    @GetMapping("/list")
    public List<Ingredient> findAll() {
        return this.ingredientService.findAll();
    }

    @PostMapping("/save")
    public IngredientDetailDto saveEntity(@RequestBody IngredientDetailDto detailDto) {
        return this.ingredientService.saveOrUpdate(detailDto);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteEntity(@RequestBody IngredientDetailDto detailDto) {
        this.ingredientService.deleteEntity(detailDto);
        return ResponseEntity.noContent().build();
    }
}
