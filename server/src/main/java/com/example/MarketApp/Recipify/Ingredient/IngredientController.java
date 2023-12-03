package com.example.MarketApp.Recipify.Ingredient;

import com.example.MarketApp.Recipify.Ingredient.dto.IngredientDetailDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/ingredient")
public class IngredientController {

    private final IngredientService ingredientService;

    public IngredientController(IngredientService ingredientService) {
        this.ingredientService = ingredientService;
    }

    @GetMapping("/list")
    public List<Ingredient> findAll(){
        List<Ingredient> ingredientList = this.ingredientService.findAll();
        return ingredientList;
    }

    @PostMapping("/save")
    public IngredientDetailDto saveEntity(@RequestBody IngredientDetailDto detailDto){
        IngredientDetailDto savedEntitytoDetailDto = this.ingredientService.saveOrUpdate(detailDto);
        return savedEntitytoDetailDto;
    }

    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteEntity(@RequestBody IngredientDetailDto detailDto){
        this.ingredientService.deleteEntity(detailDto);
        return ResponseEntity.noContent().build();
    }
}
