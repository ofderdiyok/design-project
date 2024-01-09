package com.example.MarketApp.Recipify.Recipe;

import com.example.MarketApp.Recipify.Recipe.dto.RecipeDetailDto;
import com.example.MarketApp.business.base.controller.BaseController;
import com.example.MarketApp.business.base.service.BaseService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/recipes")
public class RecipeController extends BaseController<Recipe> {
    private final RecipeService recipeService;

    public RecipeController(RecipeService recipeService) {
        this.recipeService = recipeService;
    }

    @Override
    public BaseService<Recipe> getService() {
        return this.recipeService;
    }

    @Override
    public String getName() {
        return "recipes";
    }

    //pageable a çevirebiliriz. mobil kısımını araştırmak lazım.
    @GetMapping("/list")
    public List<Recipe> findAll(){
        List<Recipe> recipeList = this.recipeService.findAll();
        return recipeList;
    }

    @PostMapping("/save")
    public RecipeDetailDto saveEntity(@RequestBody RecipeDetailDto detailDto){
        RecipeDetailDto savedEntitytoDetailDto = this.recipeService.saveOrUpdate(detailDto);
        return savedEntitytoDetailDto;
    }

    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteEntity(@RequestBody RecipeDetailDto detailDto){
        this.recipeService.deleteEntity(detailDto);
        return ResponseEntity.noContent().build();
    }
}
