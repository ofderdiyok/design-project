package com.example.MarketApp.Recipify.Ingredient;

import com.example.MarketApp.Recipify.Ingredient.dto.IngredientDetailDto;
import com.example.MarketApp.business.base.controller.BaseController;
import com.example.MarketApp.business.base.service.BaseService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/ingredients")
public class IngredientController extends BaseController<Ingredient> {

    private final IngredientService ingredientService;

    public IngredientController(IngredientService ingredientService) {
        this.ingredientService = ingredientService;
    }

    @Override
    public BaseService<Ingredient> getService() {
        return this.ingredientService;
    }

    @Override
    public String getName() {
        return "ingredients";
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
